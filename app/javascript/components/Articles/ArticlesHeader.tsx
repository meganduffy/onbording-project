import React from 'react';

export interface ArticleHeaderProps {
  title:string,
  subtitle:string
}
 
const ArticleHeader: React.FC<ArticleHeaderProps> = (props) => {
  return ( 
    <div id="articles-header">
            <h1>{props.title}</h1>
            <h2>{props.subtitle}</h2>
        </div>
  );
}
 
export default ArticleHeader;
