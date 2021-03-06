import React from "react";
import "@testing-library/jest-dom/extend-expect";
import { render } from "@testing-library/react";
import ArticleDetails from "../../components/Articles/ArticlesDetails";

const expectedTitle = "mechanism momentum museum minimum mushroom";
const expectedContent =
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
const expectedFirstName = "Megan";
const expectedLastName = "Duffy";
const expectedLink = "/articles";
const expectedLinkText = "View All Articles";
const expectedCreatedAt = "27 March 2020";
const expectedEditLink = "/articles/3/edit";
const expectedCurrentUser = 3;
const expectedEditLinkText = "Edit Article";
const expectedDeleteLink = "/articles/3/delete";
const expectedDeleteLinkText = "Delete Article"

describe("ArticleDetails", () => {
  describe("Snapshots", () => {
    test("should render the Article Details when logged out", () => {
      const { container } = render(
        <ArticleDetails
          title={expectedTitle}
          content={expectedContent}
          firstName={expectedFirstName}
          lastName={expectedLastName}
          link={expectedLink}
          linkText={expectedLinkText}
          createdAt={expectedCreatedAt}
        />
      );
      expect(container).toMatchSnapshot();
    });

    test("should render the Article Details when logged in", () => {
      const { container } = render(
        <ArticleDetails
          title={expectedTitle}
          content={expectedContent}
          firstName={expectedFirstName}
          lastName={expectedLastName}
          link={expectedLink}
          linkText={expectedLinkText}
          createdAt={expectedCreatedAt}
          editLink={expectedEditLink}
          currentUser={expectedCurrentUser}
          deleteLink={expectedDeleteLink}
        />
      );
      expect(container).toMatchSnapshot();
    });
  });

  describe("Props", () => {
    test("should render the text passed in", () => {
      const { container } = render(
        <ArticleDetails
          title={expectedTitle}
          content={expectedContent}
          firstName={expectedFirstName}
          lastName={expectedLastName}
          link={expectedLink}
          linkText={expectedLinkText}
          createdAt={expectedCreatedAt}
        />
      );
      expect(container.querySelector('div.articles-details h2')).toHaveTextContent(expectedTitle);
      expect(container.querySelector('div.articles-details p')).toHaveTextContent(expectedContent);
      expect(container.querySelector('div.articles-details-info')).toHaveTextContent(expectedFirstName);
      expect(container.querySelector('div.articles-details-info')).toHaveTextContent(expectedLastName);
      expect(container.querySelector('div.articles-aside')).toHaveTextContent(expectedLinkText);
      expect(container.querySelector('div.articles-details-info')).toHaveTextContent(expectedCreatedAt);
    });

    test("should render the hrefs passed in", () => {
      const { getByText } = render(
        <ArticleDetails
          title={expectedTitle}
          content={expectedContent}
          firstName={expectedFirstName}
          lastName={expectedLastName}
          link={expectedLink}
          linkText={expectedLinkText}
          createdAt={expectedCreatedAt}
        />
      );
      expect(getByText(expectedLinkText).href).toBe(
        `http://localhost${expectedLink}`
      );
    });

    test("should render the edit and delete options text if a current user is passed", () => {
      const { container, getByText } = render(
        <ArticleDetails
          title={expectedTitle}
          content={expectedContent}
          firstName={expectedFirstName}
          lastName={expectedLastName}
          link={expectedLink}
          linkText={expectedLinkText}
          createdAt={expectedCreatedAt}
          currentUser={expectedCurrentUser}
          editLink={expectedEditLink}
          deleteLink={expectedDeleteLink}
        />
      );
      expect(container.querySelector('div.articles-aside')).toHaveTextContent(expectedEditLinkText);
      expect(container.querySelector('div.articles-aside')).toHaveTextContent(expectedDeleteLinkText);
      expect(getByText(expectedEditLinkText).href).toBe(
        `http://localhost${expectedEditLink}`
      );
      expect(getByText(expectedDeleteLinkText).href).toBe(
        `http://localhost${expectedDeleteLink}`
      );
    });

    test('should not render the edit or delete options text if a current user is not passed', () => {
      const { container } = render(
        <ArticleDetails
          title={expectedTitle}
          content={expectedContent}
          firstName={expectedFirstName}
          lastName={expectedLastName}
          link={expectedLink}
          linkText={expectedLinkText}
          createdAt={expectedCreatedAt}
          editLink={expectedEditLink}
        />
      );
      expect(container.querySelector('div.articles-aside')).not.toHaveTextContent(expectedEditLinkText);
      expect(container.querySelector('div.articles-aside')).not.toHaveTextContent(expectedDeleteLinkText);
    });
  });
});
