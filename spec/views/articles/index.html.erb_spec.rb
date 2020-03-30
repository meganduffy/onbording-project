describe 'articles/index.html.erb', type: :view do

  describe 'GET #index' do
      it 'displays a list of articles' do
        assign(:articles, [build_stubbed(:article)])

        render

        rendered.include? "article-title"
        rendered.include? "article-content"
        rendered.include? "article-user"
        rendered.include? "article-created-at"
      end
    end
  end