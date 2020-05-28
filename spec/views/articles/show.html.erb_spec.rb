describe 'articles/show.html.erb', type: :view do
  describe 'GET #show' do

    before do
      controller.singleton_class.class_eval do
        protected
        def current_user
          FactoryBot.build_stubbed(:user)
        end
        helper_method :current_user
      end
    end

    it 'displays an entire article' do
      assign(:article, create(:article, title: 'Test', content: 'Lorem Ipsum.'))

      render

      expect(rendered).to include('Test')
      expect(rendered).to include('Lorem Ipsum.')
    end
  end
end
