import React from 'react'; 

export interface ArticleDetailsProps {
  title:string,
  content:string,
  user:string,
  created_at:string
}
 
const ArticleDetails: React.SFC<ArticleDetailsProps> = (props) => {
  return ( 
    <div id="articles-details">
      <h3 id="articles-title">{props.title}</h3>

      <p id="articles-content">{props.content}</p>

      <div id="articles-details-info">
        <p id="articles-user">{props.user}</p>
        <p id="articles-created-at">{props.created_at}</p>
      </div>
    </div>
  );
}
 
export default ArticleDetails;