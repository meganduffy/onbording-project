import React from 'react';
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import renderer from 'react-test-renderer';
import ArticlesList from '../../components/Articles/ArticlesList';

let container = null;

let singleArticle = [{id: 1, title: "Title1", content: "Lorem Ipsum blah blah", 
created_at: "2020-03-27T10:53:09.881Z", user: {first_name: "Megan"}}]

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
  const tree = renderer.create(<ArticlesList 
    articles={singleArticle} />).toJSON();
  expect(tree).toMatchSnapshot();
});
