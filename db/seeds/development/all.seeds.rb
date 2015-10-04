user = FactoryGirl.create(:user)
commenter = FactoryGirl.create(:user)
FactoryGirl.create_list(:article, 5, :with_comments, user: user, commenter: commenter)
