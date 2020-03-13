RSpec.describe SessionsController, type: :controller do

  describe "POST #create" do
    context "with correct params" do
      let(:parameters) { { user: { email: 'login@login.com', password: 'login'} } }

      it "redirects to homepage"
      it "returns a 302 Temp Redirect"
    end

    context "without correct params" do
      it "re-renders #new form"
      it "does not return a 302 Temp Redirect response"
    end
  end

end