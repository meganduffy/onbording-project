import React from 'react';

export interface ArticlesDetailsProps {
    title:string,
    content:string,
    firstName:string,
    lastName?:string,
    created_at:string,
    link:string,
    linkText:string,
    editLink?:string,
    currentUser:number
}

const ArticlesDetails: React.FC<ArticlesDetailsProps> = (props) => {

    let loggedInDisplay = null

    if (props.currentUser) {
        let loggedInDisplay = (<a href={props.editLink}>Edit Article</a> )
    } 

    return (
        
        <div className="outer-article-container">
            <div className="articles-details">
                <h2 className="articles-title">{props.title}</h2>

                <p>{props.content}</p>

                <div className="articles-details-info">
                    <p>{props.firstName} {props.lastName}</p>
                    <p>{props.created_at}</p>
                </div>
            </div>

            <div className="articles-aside">
                <a href={props.link}>{props.linkText}</a>        
                {loggedInDisplay}
            </div>
        </div>
    )
}

export default ArticlesDetails;
