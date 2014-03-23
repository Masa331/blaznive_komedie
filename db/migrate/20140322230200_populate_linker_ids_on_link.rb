class PopulateLinkerIdsOnLink < ActiveRecord::Migration
  def change
    # nezkopirovalo se
    Link.all.each do |link|
      link.linker_id = link.video_id
      link.linker_type = 'Video'
      link.save
    end
  end
end
