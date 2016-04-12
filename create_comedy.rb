require 'aws-sdk'
require 'mime-types'

def content_type(filepath)
  MIME::Types.type_for(filepath).first.to_s
end

cz_title = 'Marmaduk'
en_title = 'Marmaduke'
text = 'Devadesáti kilový pes marmaduk se spolue se svojí rodinou přestěhuje z amerického středozápadu do slunné Orange County. Obrovský pes má kvůli své velikosti zezačátku potíže najít si přátele a partnerku ale se vším mu naštěstí pomáhá nevlastní bratr Carlos a ruská modrá kočka. Bláznivá rodinná komedie plná mluvících zvířat.'

video_title = 'Marmaduke'
video_link = 'https://www.youtube.com/embed/xGx6IhjoWqw'

image_title = 'Marmaduke'
image_aws_title = 'marmaduke'
image_path = '/home/masa331/pracovni/imagine/komedie/comedy_posters/marmaduke.jpg'
image_content_type = content_type(image_path)

comedy = Comedy.create!(cz_title: cz_title,
                        en_title: en_title,
                        text: text)

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
