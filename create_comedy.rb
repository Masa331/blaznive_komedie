require 'aws-sdk'
require 'mime-types'

def content_type(filepath)
  MIME::Types.type_for(filepath).first.to_s
end

cz_title = 'Santa je úchyl!'
en_title = 'Bad Santa'
text = 'Tenhle rok mají dva ztroskotaní trestanci Willie a Marcus geniální plán. Převlečou se za Santu a jeho pomocníka a objedou před vánoci velká nákupní centra a ta vykradou. Problém nastane, když potkají osmiletého chlapce, který se jim pravou podstatu vánoc snaží vyvětlit.'
tag_list = ''

video_title = 'Santa je úchyl!'
video_link = 'https://www.youtube.com/embed/V6WO7q_80MI'

image_title = 'Santa je úchyl!'
image_aws_title = 'bad_santa'
image_path = '/home/masa331/pracovni/imagine/komedie/comedy_posters/bad_santa.jpg'
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
