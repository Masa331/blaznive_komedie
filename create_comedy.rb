require 'aws-sdk'
require 'mime-types'

def content_type(filepath)
  MIME::Types.type_for(filepath).first.to_s
end

cz_title = 'Karlík a továrna na čokoládu'
en_title = 'Charlie and the Chocolate Factory'
text = 'Charlie Bucket je malý chlapec, pochádzajúci z celkom zbedačenej rodiny, býva na okraji mesta hneď vedľa obrovskej továrne na čokoládu. Charlie miluje čokoládu, aj keď dostáva čokoládový bombón len raz do roka. Jedného dňa však vyhrá aj s ďalšími štyrmi deťmi cestu po fantastickej čokoládovej továrni, ktorú vlastní excentrický Willy Wonka a jeho nemenej zaujímaví zamestnanci.**(oficiální text distributora)**'

video_title = 'Karlík a továrna na čokoládu'
video_link = 'http://www.youtube.com/embed/84srLOhooN8'

image_title = 'Karlík a továrna na čokoládu'
image_aws_title = 'charlie_and_chocolate_factory'
image_path = '/home/masa331/pracovni/imagine/komedie/comedy_posters/charlie_and_chocolate_factory.jpg'
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
