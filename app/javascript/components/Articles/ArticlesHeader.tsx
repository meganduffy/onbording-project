import React from "react"

type ArticleHeaderProps = {
    title:string,
    subtitle:string
}

class ArticleHeader extends React.Component<ArticleHeaderProps> {
  render () {
    return (
        <div>
            <h1>{this.props.title}</h1>
            <h2>{this.props.subtitle}</h2>
        </div>
    );
  }
}

export default ArticleHeader;
