import React from 'react';

type MyProps = {
  name?: string;
}

function Hello(props:MyProps) {
  if(props.name) {
    return <h1>Hello {props.name}</h1>
  }
  else {
    return <h1>Greetings Stranger</h1>
  }
}

export default Hello;