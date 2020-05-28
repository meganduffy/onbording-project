describe 'articles/edit.html.erb', type: :view do
    describe 'GET #edit' do
        it 'contains the article title' do
            assign(:article, create(:article, title: "Article Title"))
            
            render

            expect(response).to include("Article Title")
        end

        it 'contains the article content' do
            assign(:article, create(:article, content: "Article content"))
            
            render

            expect(response).to include("Article content")
        end
    end
end
