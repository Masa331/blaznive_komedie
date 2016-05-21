require 'aws-sdk'
require 'mime-types'

def content_type(filepath)
  MIME::Types.type_for(filepath).first.to_s
end

cz_title = 'Po čem ženy touží'
en_title = 'What Women Want'
text = 'Nick Marshall (Mel Gibson) je chamtivý šovinistický hlupák, zaměstnaný ve velmi dobře prosperující reklamní agentuře v Chicagu, kterou vede Dan Vanamaker (Alan Alda). Ženy jsou pro něj převážně jako tmel v jeho rukou, což podporuje jeho přesvědčení, že je schopen se vmanévrovat do ženské atmosféry. Je přesvědčen, že jedině on má nárok na uvolněné místo kreativního ředitele v agentuře. Ale "jeho" místo, k Nickově velkému překvapení a zklamání, dostává Darcy Maguire (Helen Hunt), ambiciózní kariéristická žena, která, zdá se, je předurčena být v neustálém konfliktu s egoistickým Nickem. Po nehodě v koupelně (Nick zasažen elektrickým proudem spadne do vany), ráno objeví, že má schopnost poslouchat, co si ženy myslí. Jeho služebná se nepošklebovala jako obvykle, dokonce ani jeho vrátná mu slovně nelichotí, jaké má krásné pozadí. To je, co si tyto ženy myslí, co je uloženo jen v jejich hlavách. Zpočátku je Nick poměrně zděšen, ale brzy je rozverně vzrušen představou, že zná všechno, co je ukryto v ženském mozku. A to se velmi hodí v přítomnosti kolegyně Darcy. Náhle dva rivalové jsou spojenci.(oficiální text distributora)'
tag_list = 'Romantické'

video_title = 'Po čem ženy touží'
video_link = 'https://www.youtube.com/embed/9mow1lpeD3g'

image_title = 'Po čem ženy touží'
image_aws_title = 'what_women_want.jpg'
image_path = '/home/masa331/pracovni/imagine/komedie/comedy_posters/what_women_want.jpg'
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
