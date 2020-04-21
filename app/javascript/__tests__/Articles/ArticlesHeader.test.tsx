import React from 'react';
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import renderer from 'react-test-renderer';
import ArticleHeader from '../../components/Articles/ArticlesHeader';

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
  const tree = renderer.create(<ArticleHeader title='Article Header' subtitle='Ipsum Lorem'
   />).toJSON();
  expect(tree).toMatchSnapshot();
});

it( 'renders with a title', ()=>{
    act( ()=>{render(<ArticleHeader title='Article Header'/>, container)} )
        expect(container.textContent).toBe("Article Header")
});
