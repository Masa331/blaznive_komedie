require 'aws-sdk'
require 'mime-types'

def content_type(filepath)
  MIME::Types.type_for(filepath).first.to_s
end

cz_title = 'Raubíř Ralf'
en_title = 'Wreck-It Ralph'
text = 'Raubíř Ralf touží po tom, aby byl milován tak, jako perfektní Good Guy jménem Fix-It Felix z jeho hry. Problém je v tom, že nikdo nemiluje Bad Guye. Ale oni milují hrdiny… takže když přichází moderní hra ve stylu kdo dřív vystřelí, kde se objeví neoblomná Sergeant Calhoun, Ralph to vidí jako příležitost k hrdinství a štěstí. Vplíží se do hry s jednoduchým plánem – vyhrát medaili – ale brzy zničí všechno a nechtěně vypustí smrtelného nepřítele, který ohrožuje každou hru v arkádě. Jediná Ralphova naděje? Vanellope von Schweetz, mladá problémistka z hry o závodění, která je tou jedinou, kdo může Ralpha naučit, co to znamená být Good Guy. Ale zjistí, že je natolik dobrý, aby se stal hrdinou před tím, než se objeví pro celou arkádu nápis „Game Over“? (oficiální text distributora)'
tag_list = 'Rodinné, Animované'

video_title = 'Raubíř Ralf'
video_link = 'https://www.youtube.com/embed/qmTfZpIn9uE'

image_title = 'Raubíř Ralf'
image_aws_title = 'raubir_ralf.jpg'
image_path = '/home/masa331/pracovni/imagine/komedie/comedy_posters/raubir_ralf.jpg'
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
