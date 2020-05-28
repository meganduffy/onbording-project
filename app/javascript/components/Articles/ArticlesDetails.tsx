import React from 'react';

export interface ArticlesDetailsProps {
    title:string,
    content:string,
    firstName:string,
    lastName?:string,
    createdAt:string,
    link:string,
    linkText:string,
    editLink?:string,
    currentUser?:number
}

const ArticlesDetails: React.FC<ArticlesDetailsProps> = (props) => {

    let editArticle = null

    let deleteArticle = null

    if (props.currentUser > 0) {
        editArticle = (<a href={props.editLink}>Edit Article</a> )
        deleteArticle = (<a href='/'>Delete Article</a>)
    } 

    return (
        
        <div className="outer-article-container" data-testid="article-details">
            <div className="articles-details">
                <h2 className="articles-title">{props.title}</h2>

                <p>{props.content}</p>

                <div className="articles-details-info">
                    <p>{props.firstName} {props.lastName}</p>
                    <p>{props.createdAt}</p>
                </div>
            </div>

            <div className="articles-aside">
                <a href={props.link}>{props.linkText}</a>        
                {editArticle}
                {deleteArticle}
            </div>
        </div>
    )
}

export default ArticlesDetails;
