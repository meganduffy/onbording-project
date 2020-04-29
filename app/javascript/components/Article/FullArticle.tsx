import React from 'react';

export interface FullArticleProps {
    title:string,
    content:string,
    first_name:string,
    last_name:string,
    created_at:string
}

const FullArticle: React.FC<FullArticleProps> = (props) => {
    return (
        <div>
            <h1>{props.title}</h1>

            <p>{props.content}</p>

            <p id="articles-user">{props.first_name} {props.last_name}</p>
            <p id="articles-created-at">{props.created_at}</p>
        </div>
    )
}

export default FullArticle;