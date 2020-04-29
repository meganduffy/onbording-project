import React from 'react';

export interface ArticlesHeaderProps {
  title:string,
  subtitle:string
}
 
const ArticlesHeader: React.FC<ArticlesHeaderProps> = (props) => {
  return ( 
    <div id="articles-header">
            <h1>{props.title}</h1>
            <h2>{props.subtitle}</h2>
        </div>
  );
}
 
export default ArticlesHeader;
