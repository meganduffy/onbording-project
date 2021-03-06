import React from "react";
import ArticlesDetails from './ArticlesDetails';

export interface ArticlesListProps {
    currentUser:any,
    articles?:any
}

const ArticlesList: React.FC<ArticlesListProps> = (props) => {

    let display = (<h3>It looks as though there's nothing here yet!</h3>)

    function formatDate(date) {
        let msec = Date.parse(date)
        let newDate = new Date(msec)
        return newDate.toDateString()
    }

    if (props.articles.length >= 1) {
        display = <div>
            {props.articles.map((article, index) => 
                <ArticlesDetails 
                key={article.id} 
                title={article.title} 
                content={article.content.substring(0, 300) + "..."}
                firstName={article.user.first_name}
                createdAt={formatDate(article.created_at)}
                link={`/articles/${article.id}`}
                linkText="View Full Article"
                editLink={`/articles/${article.id}/edit`}
                deleteLink={`/articles/${article.id}/delete`}
                currentUser={props.currentUser} />
            )}
        </div> 
    } 

    

    return (
        <div>
            {display}
        </div>      
    )
}

export default ArticlesList;
