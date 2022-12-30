-- fix image links to let README.md point to the correct image path in example

function Image(img)
    img.src = img.src:gsub("^img/", "example/img/")
    return img
end
