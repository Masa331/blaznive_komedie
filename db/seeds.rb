require 'factory_girl'
FactoryGirl.reload
Admin.create(email: 'admin@csm.cz', password: 'password')
Category.create(title: 'Akční komedie')

FactoryGirl.create(:comedy_with_image_and_video)
FactoryGirl.create(:comedy_with_image_and_video, cz_title: 'Americká krása', en_title: 'American beauty')

FactoryGirl.create(:post)
FactoryGirl.create(:video)
FactoryGirl.create(:image)
