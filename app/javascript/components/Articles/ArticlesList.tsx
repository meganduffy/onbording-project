import React, { useState, useEffect } from "react";
import ArticlesDetails from './ArticlesDetails';
import { array } from "prop-types";

export interface ArticlesListProps {
    link?:string,
    currentUser:any
}

export default function ArticlesList(props) {

    let display = (<h3>It looks as though there's nothing here yet!</h3>)

    if (props.articles.length >= 1) {
        display = <div>
            {props.articles.map((article, index) => 
                <ArticlesDetails 
                key={article.id} 
                title={article.title} 
                content={article.content.substring(0, 300) + "..."}
                firstName={article.user.first_name}
                createdAt={article.createdAt}
                link={`/articles/${article.id}`}
                linkText="View Full Article"
                editLink={`/articles/${article.id}/edit`}
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
