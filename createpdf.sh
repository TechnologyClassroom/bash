# createpdf.sh
# Michael McMahon

# Create a small pdf from jpg files labeled p01.jpg, p02.jpg, etc.

# Requires imagemagick.

convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% p*.jpg -compress jpeg out3.pdf

# based on Yves M. and Felipe Buccioni from https://stackoverflow.com/questions/7261855/recommendation-for-compressing-jpg-files-with-imagemagick
