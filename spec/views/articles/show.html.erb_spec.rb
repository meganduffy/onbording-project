describe 'articles/show.html.erb', type: :view do
  describe 'GET #show' do
    it 'displays an entire article' do
      assign(:article, create(:article, title: 'Test', content: 'Lorem Ipsum.'))

      render

      expect(rendered).to include('Test')
      expect(rendered).to include('Lorem Ipsum.')
    end
  end
end
