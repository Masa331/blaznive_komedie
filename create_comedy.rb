require 'aws-sdk'
require 'mime-types'

def content_type(filepath)
  MIME::Types.type_for(filepath).first.to_s
end

cz_title = 'Sousedi 2'
en_title = 'Neighbors 2: Sorority Rising'
text = 'Seth Rogen a Rose Byrne se jako Mac a Kelly vrací v pokračování úspěšné komedie Sousedi. Po urputném boji z prvního dílu jsou Mac a Kelly konečně v klidu a rozhodnou se pořídít si další dítě. Kvůlu tomu se rozhodnou přestěhovat a prodat svůj starý dům. Bohužel jeho cena začne rapidně klesat jakmile se do sousedství nastěhuje parta vysokoškolaček, které pořádají jednu párty za druhou. Mac s Kelly velice rychle zjistí, že staré triky na nové nepřátele neplatí a tak si nakone musí na pozvat na pomoc svého bývalého úhlavního nepřítele z prvního dílu Teddyho(Zac Efron).'
tag_list = 'Seth Rogen'

video_title = 'Sousedi 2'
video_link = 'https://www.youtube.com/embed/JymLhJMNq3E'

image_title = 'Sousedi 2'
image_aws_title = 'neighbors2.jpg'
image_path = '/home/masa331/pracovni/imagine/komedie/comedy_posters/sousedi2.jpg'
image_content_type = content_type(image_path)

comedy = Comedy.create!(cz_title: cz_title,
                        en_title: en_title,
                        text: text,
                        tag_list: tag_list)

video = Video.create!(title: video_title,
                      comedy: comedy)

YoutubeLink.create!(uri: video_link,
                    linker_id: video.id,
                    linker_type: 'Video')

aws_key = Rails.application.secrets[:aws_key]
aws_secret = Rails.application.secrets[:aws_secret]

client = Aws::S3::Client.new(region: 'eu-central-1',
                         credentials: Aws::Credentials.new(aws_key, aws_secret))

s3 = Aws::S3::Resource.new(client: client)
bucket = s3.bucket('blaznivekomedie')
poster = bucket.object(image_aws_title)
poster.upload_file(image_path, acl: 'public-read', content_type: image_content_type)

Image.create!(comedy: comedy, title: image_title, image_url: poster.public_url)
