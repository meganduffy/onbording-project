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
        <div className="articles-details">
            <h1 className="articles-title">{props.title}</h1>

            <p>{props.content}</p>

            <div className="articles-details-info">
                <p>{props.first_name} {props.last_name}</p>
                <p>{props.created_at}</p>
            </div>

            
        </div>
    )
}

export default FullArticle;