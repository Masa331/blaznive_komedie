FactoryGirl.define do
  factory :comedy do
    publish true
    cz_title 'Slunce seno'
    en_title 'Sun haystack'
    text 'Nejlepší komedie na světě. Jo to je takhle komedie s Melem Gibsnem v hlavní roli. Jo to se fakt strašne moc nasmějet. I psy se budou smát.'
    category

    trait :with_image do
      image
    end

    trait :with_video do
      video
    end

    factory :comedy_with_image, traits: [ :with_image ]
    factory :comedy_with_image_and_video, traits: [ :with_image, :with_video ]
  end
end
