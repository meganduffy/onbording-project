describe 'articles/index.html.erb', type: :view do

  describe 'GET #index' do
      it 'displays a list of articles' do
        assign(:articles, [build_stubbed(:article, title: "Test", content: "Lorem Ipsum.")])

        render

        expect(rendered).to have_content("Test")
        expect(rendered).to have_content("Lorem Ipsum.")
      end
    end
  end