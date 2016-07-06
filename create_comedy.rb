require 'aws-sdk'
require 'mime-types'

def content_type(filepath)
  MIME::Types.type_for(filepath).first.to_s
end

cz_title = "The Bronze"
en_title = "The Bronze"
text = "Hope Ann Greggory(Melissa Raunch - Big Bang Theory) je bývala gymnastická olympijská medailistka, jejíž kariéru předčasně ukončilo zranění. Teď už je náplní Hopina dne akorát poflakování se po rodném městečku. Když se ale v městečku objeví jiná mladá nadějná gymnastka, musí se Hope rozhodnout co s tím. Arogantně jí setře, aby neohrozila zbytky svojí slávy, nebo se s velkým sebezapřením pokusí ji trénovat?"

tag_list = ''

video_title = "The Bronze"
video_link = "https://www.youtube.com/embed/6B7JH30oCME"

image_title = 'The Bronze'
image_aws_title = 'the_bronze.jpeg'
image_path = '/home/masa331/pracovni/imagine/komedie/comedy_posters/the_bronze.jpeg'
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
