import React from 'react';
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import renderer from 'react-test-renderer';
import ArticleDetails from '../../components/Articles/ArticlesDetails';

let container = null;

beforeEach(() => {
  container = document.createElement("div");
  document.body.appendChild(container);
});

afterEach(() => {
  unmountComponentAtNode(container);
  container.remove();
  container = null;
});

it('renders correctly', ()=>{
  const tree = renderer.create(<ArticleDetails 
    title='New Post' 
    content='Ipsum Lorem'
    firstName='Megan' 
    link='google.com' 
    linkText='Click Here' 
    created_at='27 March 2020' 
    editLink='/articles/3/edit'/>).toJSON();
  expect(tree).toMatchSnapshot();
});
