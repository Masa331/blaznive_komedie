require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ImagineCms
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :cs

    config.to_prepare do
      Devise::SessionsController.layout 'administration'
      Devise::RegistrationsController.layout 'administration'
      Devise::ConfirmationsController.layout 'administration'
      Devise::UnlocksController.layout 'administration'
      Devise::PasswordsController.layout 'administration'
    end

    config.assets.initialize_on_precompile = false

    old_slugs = ["borat",
      "desnej-bijak-scary-movie",
      "spanish-movie",
      "prci-prci-prcicky-kniha-lasky-american-pie-presents-the-book-of-love",
      "zpravar-pribeh-rona-burgundyho-anchorman-the-legend-of-ron-burgundy",
      "silenci-na-prknech-out-cold",
      "blackball",
      "disaster-movie","tohle-je-sparta-meet-the-spartans",
      "stan-helsing",
      "desnej-bijak-3-scary-movie-3",
      "desnej-bijak-4-scary-movie-4",
      "velkej-bijak-epic-movie",
      "hele-kamo-kdo-tu-vari-waiting",
      "desnej-dupak-dance-flick",
      "zhave-vystrely-hot-shots",
      "blazniva-strela-3-a-1-3-the-naked-gun-33-1-3-the-final-insult",
      "volte-me-the-campaign","cmuchalky-dick",
      "zahulime-uvidime-harold-kumar-go-to-white-castle",
      "desnej-dojak-date-movie",
      "zhave-vystrely-2-hot-shots-part-deux",
      "prisne-tajne-top-secret",
      "blazniva-strela-the-naked-gun-from-the-files-of-police-squad",
      "pribeh-wendella-bakera-the-wendell-baker-story",
      "blazniva-strela-2-a-1-2-the-naked-gun-2-1-2-the-smell-of-fear",
      "zahulime-uvidime-2-harold-kumar-escape-from-guantanamo-bay",
      "diktator-the-dictator",
      "laska-nebeska-love-actually",
      "pripoutejte-se-prosim-airplane",
      "nejlepsi-film-jaky-byl-kdy-prodan-the-greatest-movie-ever-sold",
      "slunce-seno-jahody",
      "zack-a-miri-toci-porno-zack-and-miri-make-a-porno",
      "prci-prci-prcicky-naha-mile-american-pie-presents-the-naked-mile",
      "muj-otec-je-silenec-that-s-my-boy",
      "mladi-v-trapu-old-school",
      "prci-prci-prcicky-2-american-pie-2",
      "vometaci-men-with-brooms",
      "blby-a-blbejsi-dumb-dumber",
      "drakuloviny-dracula-dead-and-loving-it",
      "road-trip","blaznive-dedictvi-surf-ninjas",
      "prci-prci-prcicky-spolek-beta-american-pie-presents-beta-house",
      "travicka-zelena-pineapple-express",
      "maska-the-mask",
      "pred-svatbou-ne-hearthbreakers",
      "desnej-bijak-2-scary-movie-2",
      "50-50","kseftari-the-goods-live-hard-sell-hard",
      "vybijena-dodgeball-a-true-underdog-story",
      "cable-guy-the-cable-guy",
      "ali-g-in-da-house",
      "komici-funny-people",
      "prci-prci-prcicky-american-pie",
      "prci-prci-prcicky-skolni-sraz-american-pie-reunion",
      "zevlovat-a-prudit-observe-and-report",
      "bruno-bruno",
      "my-dva-a-kren-you-me-and-dupree",
      "zbouchnuta-knocked-up",
      "blbec-k-veceri-dinner-for-schmucks",
      "zoolander","rrrrrrr",
      "eurotrip",
      "superbad",
      "moje-krasna-carodejka-bewitched",
      "suprhrdina-superhero-movie",
      "cetnik-ze-saint-tropez-le-gendarme-de-st-tropez",
      "nesvatbovi-wedding-crashers",
      "ace-ventura-zvireci-detektiv-ace-ventura-pet-detective",
      "zelena-je-trava-kicking-screaming",
      "jay-a-mlcenlivy-bob-vraci-uder-jay-and-silent-bob-strike-back",
      "malery-pana-ucetniho-fantozzi-contro-tutti",
      "parba-v-bangkoku-the-hangove-part-ii",
      "fanousci-fanboys",
      "tady-to-musi-byt-this-must-be-the-place",
      "starsky-hutch",
      "ceska-soda",
      "slava-jen-pro-mrtve-pauly-shore-is-dead",
      "yes-man",
      "sisouni-v-new-yorku-coneheads",
      "superstar",
      "parba-ve-vegas-the-hangover",
      "utopenec-na-uteku-wrongfully-accused",
      "corky-romano-nocni-mura-mafie-corky-romano",
      "ja-me-druhe-ja-a-irena-me-myself-irene",
      "mlceni-sunek-the-silence-of-the-hams",
      "pidihajzlik-little-man",
      "prava-blondynka-legally-blonde",
      "vim-co-jsi-delal-minuly-patek-13-shriek-if-you-know-what-i-did-last-friday-the-thirteenth",
      "prci-prci-prcicky-na-tabore-american-pie-presents-band-camp",
      "bratri-z-donuceni-step-brothers",
      "poloprofesional-semi-pro",
      "ledove-ostri-blades-of-glory",
      "plnou-parou-vzad-boat-trip",
      "okresni-prebor-posledni-zapas-pepika-hnatka",
      "prava-blondynka-2-legally-blonde-2-red-white-blonde",
      "meda-ted","urcite-mozna-definitely-maybe",
      "sexualni-praktiky-pozemstanu-the-mating-habits-of-the-earthbound-human",
      "bublinak-bubble-boy",
      "blby-a-jeste-blbejsi-jak-harry-potkal-lloyda-dumb-and-dumberer-when-harry-met-lloyd",
      "zahulime-uvidime-3-a-very-harold-kumar-3d-christmas",
      "sex-drive","benga-v-zaloze-the-other-guys",
      "sam-doma-home-alone",
      "tupiri-vampires-suck",
      "prci-prci-prcicky-3-svatba-american-wedding",
      "policejni-akademie-police-academy",
      "noc-v-roxbury-a-night-at-the-roxbury",
      "ambiciozni-blondynka-blonde-ambition",
      "hele-vole-kde-mam-karu-dude-where-s-my-car",
      "agent-wc-40-spy-hard",
      "40-let-panic-the-40-year-old-virgin",
      "vanocni-skritek-elf",
      "na-doraz-due-date"]

    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      old_slugs.each do |slug|
        r301 "/#{slug}", "/comedies/#{slug}"
      end
    end

  end
end
