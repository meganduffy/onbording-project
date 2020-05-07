import React, { useState, useEffect } from "react";
import ArticlesDetails from './ArticlesDetails';
import { array } from "prop-types";

export interface ArticlesListProps {
    link?:string
}

export default function ArticlesList(props) {

    let display = (<h3>It looks as though there's nothing here yet!</h3>)

    function formatDate(date) {
        let foo = date.toString().split('T')[0]
        let bar = foo.split('-')
        return bar[2] + "-" + bar[1] + "-" + bar[0] 
    }

    if (props.articles) {
        display = <div>
            {props.articles.map((article, index) => 
                <ArticlesDetails 
                key={index} 
                title={article.title} 
                content={article.content.substring(0, 300) + "..."}
                created_at={formatDate(article.created_at)}
                link={props.link}
                linkText="View Full Article" 
                />
            )}
        </div> 
    }

    return (
        <div>
            {display}
        </div>
        
    )
}
