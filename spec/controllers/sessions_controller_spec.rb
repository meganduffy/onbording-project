RSpec.describe SessionsController, type: :controller do


  describe "POST #create" do
    context "with correct params" do

      let(:existing_user) { create(:user) }

      it "redirects to homepage" do
        post :create, params: existing_user
        expect(response).to redirect_to "/"
      end
      it "returns a 302 Temp Redirect"
      it "removes the login button"
      it "triggers as logout button to appear"
    end

    context "without correct params" do
      it "re-renders #new form"
      it "does not return a 302 Temp Redirect response"
    end
  end

end