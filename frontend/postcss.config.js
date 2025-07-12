module.exports = {
  plugins: [
    require('@tailwindcss/postcss')(),  // 👈 nuevo plugin necesario
    require('autoprefixer'),
  ]
}
