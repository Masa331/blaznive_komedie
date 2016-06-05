require 'aws-sdk'
require 'mime-types'

def content_type(filepath)
  MIME::Types.type_for(filepath).first.to_s
end

cz_title = 'Milionový závod'
en_title = 'Rat Rate'
text = 'Bohatý majitel casina Donald Sinclair (John Cleese) připravi pro obveselení svých klientů novinku: veliký závod o dva miliony dolarů. Zbohatlíci se o ně ovšem nebudou ucházet sami, ale budou sázet na šest týmů, lačnících po bohatství. Potenciální milionáři jsou vybráni náhodně a vzniknou tak notně bizarní sestavy: Rozhádaná židovská rodina s užvaněným otcem (Jon Lovitz), bratři-kriminálníci (Seth Green, Vince Vileuf), upjatý obchodník a krásná pilotka (Breckin Meyer, Amy Smart), matka, usmiřující se s dcerou (Whoopi Goldberg, Lanei Chapman), fotbalový rozhodčí na útěku (Cuba Gooding, Jr.) a narkoleptický Ital (Rowan Atkinson). Na cestu z Las Vegas do Nového Mexika mohou vyrazit jakkoli - pěšky, autem, letadlem, na koni, nebo v balónu. Pravidla nejsou žádná - zbohatne jen ten nejrychlejší... a nejzákeřnější. (oficiální text distributora)'
tag_list = 'Cuba Gooding Jr.'

video_title = 'Milionový závod - Rat Race'
video_link = 'https://www.youtube.com/embed/2FPN8H9jiXY'

image_title = 'Rat Race'
image_aws_title = 'rat_race.png'
image_path = '/home/masa331/pracovni/imagine/komedie/comedy_posters/rat_race.png'
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
