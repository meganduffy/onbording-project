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
  const tree = renderer.create(<ArticleDetails title='New Post' content='Ipsum Lorem'
  user='Megan' created_at='27 March 2020' />).toJSON();
  expect(tree).toMatchSnapshot();
});

it( 'renders with a title', ()=>{
    act( ()=>{render(<ArticleDetails title='New Post' />, container)} )
        expect(container.textContent).toBe("New Post")
});
