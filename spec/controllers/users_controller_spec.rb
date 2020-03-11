require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST #create" do
    context "with correct params" do
      let(:parameters) { { user: { first_name: 'Megan', last_name: 'Duffy',
                                   email: 'unique@email.com', password: 'hard2guess' } } }
      it "redirects to homepage" do
        post :create, params: parameters
        expect(response).to redirect_to "/"
      end

      it "returns a 302 Temp Redirect response" do
        post :create, params: parameters
        expect(response.status).to eq(302)
      end

      it "saves a new user to the database" do
        expect {
          post :create, params: parameters
        }.to change(User, :count).by(1)
      end
    end

    context "without correct params" do
      let(:parameters) { { user: { last_name: 'Duffy',
                                   email: 'unique@email.com', password: 'hard2guess' } } }
      it "re-renders #new form" do
        post :create, params: parameters
        expect(response).to render_template "new"
      end

      it "does not return a 302 Temp Redirect response" do
        post :create, params: parameters
        expect(response.status).to_not eq(302)
      end

      it "does not save a new user to the database" do
        expect {
          post :create, params: parameters
        }.to_not change(User, :count)
      end
    end
  end
end