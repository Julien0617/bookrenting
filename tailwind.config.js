module.exports = {
  purge: [
    "./app/**/*.html.erb",
    ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      gridTemplateColumns: {
       'form': '190px minmax(900px, 1fr) 100px',
      },
      backgroundImage: {
        'book': "url('/book.jpeg')",
       }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
