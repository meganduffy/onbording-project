describe 'articles/index.html.erb', type: :view do
  describe 'GET #index' do
    context 'if there is one article' do
      it 'displays the Article Component' do
        assign(:articles, [build_stubbed(:article, title: 'Test', content: 'Lorem Ipsum.')])

        render

        expect(rendered).to include('Articles/ArticlesList')
      end
    end

    context 'if there is more than one article' do
      it 'displays a list of articles' do
        assign(:articles, [build_stubbed(:article, title: 'Test1', content: '1. Lorem Ipsum.'),
                           build_stubbed(:article, title: 'Test2', content: '2. Lorem Ipsum.')])

        render
        
        expect(rendered).to include('Articles/ArticlesList', 'Articles/ArticlesList')
      end
    end

    context 'if there are any articles' do
      it 'does not display no articles message' do
        assign(:articles, [build_stubbed(:article, title: 'Test', content: 'Lorem Ipsum.')])

        render

        expect(rendered).to_not have_content("It looks as though there's nothing here yet!")
      end
    end
  end
end
