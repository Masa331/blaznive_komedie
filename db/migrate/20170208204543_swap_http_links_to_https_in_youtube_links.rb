class SwapHttpLinksToHttpsInYoutubeLinks < ActiveRecord::Migration[5.0]
  def change
    YoutubeLink.all.each { |link| link.update(uri: link.uri.gsub('http://', 'https://')) }
  end
end
