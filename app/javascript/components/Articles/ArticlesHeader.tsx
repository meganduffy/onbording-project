import React from "react";

export interface ArticlesHeaderProps {
  title: string;
  subtitle: string;
  link: string;
}

const ArticlesHeader: React.FC<ArticlesHeaderProps> = (props) => {
  return (
    <div id="articles-header">
      <a href={props.link} data-testid="article-header-link">
        <h1>{props.title}</h1>
        <h2>{props.subtitle}</h2>
      </a>
      <br></br>
    </div>
  );
};

export default ArticlesHeader;
