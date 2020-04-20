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
        <div id="articles-details">
            <h3 id="article-title">{this.props.title}</p>

            <p id="articles-content">{this.props.content}</p>

            <div>
              <p id="articles-user">{this.props.user}</p>
              <p id="articles-created-at">{this.props.created_at}</p>
            </div>
        </div>
    );
  }
}

export default ArticleDetails;
