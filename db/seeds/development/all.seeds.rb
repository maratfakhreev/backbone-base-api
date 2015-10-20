user = FactoryGirl.create(:user)
commenter = FactoryGirl.create(:user)
FactoryGirl.create_list(:article, 50, :with_comments, user: user, commenter: commenter)
