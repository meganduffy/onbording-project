import React from 'react'; 

export interface ArticlesDetailsProps {
  title:string,
  content:string,
  user:string,
  created_at:string
}
 
const ArticlesDetails: React.FC<ArticlesDetailsProps> = (props) => {
  return ( 
    <div id="articles-details">
      <h3 id="articles-title">{props.title}</h3>

      <p>{props.content}</p>

      <div id="articles-details-info">
        <p>{props.user}</p>
        <p>{props.created_at}</p>
      </div>
    </div>
  );
}
 
export default ArticlesDetails;