import React from "react"

type ArticleDetailsProps = {
    title?:string,
    content?:string,
    user?:string,
    created_at?:string
}

class ArticleDetails extends React.Component<ArticleDetailsProps> {
  render () {
    return (
        <div>
            <p id="article-title">{this.props.title}</p>

            <p id="article-content">{this.props.content}</p>

            <p id="article-user">{this.props.user}</p>

            <p id="article-created-at">{this.props.created_at}</p>
        </div>
    );
  }
}

export default ArticleDetails;
