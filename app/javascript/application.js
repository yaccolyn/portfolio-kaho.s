// Entry point for the build script in your package.json<
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"


 document.addEventListener('turbo:load', () => {
   // フォームのプレビュー用
   const input = document.getElementById('picture-input');
   const previewContainer = document.getElementById('image-preview');

   const setContainerStyle = (container, cols, cellSize) => {
     container.style.display = 'grid';
     container.style.gridTemplateColumns = `repeat(${cols}, ${cellSize}px)`;
     container.style.gridAutoRows = `${cellSize}px`;
     container.style.gap = '20px'; // グリッド間のスペース
   };

   const appendImage = (container, src, cellSize) => {
     const img = document.createElement('img');
     img.src = src;
     img.style.width = `${cellSize}px`;
     img.style.height = `${cellSize}px`;
     img.style.objectFit = 'cover';
     container.appendChild(img);
   };

   if (input) {
     input.addEventListener('change', () => {
       previewContainer.innerHTML = '';
       const files = Array.from(input.files).filter(file => file.size > 0);
       const maxFiles = 4;

       if (!files.length) {
         console.log('No files selected.');
         return;
       }

       console.log('Filtered files:', files);

       const fileCount = files.length <= maxFiles ? files.length : maxFiles;
       const rows = Math.ceil(fileCount / 2); // 行数
       const cols = fileCount < 2 ? 1 : 2; // 列数
       const cellSize = 300; // セルサイズ

       setContainerStyle(previewContainer, cols, cellSize);

       for (let i = 0; i < files.length && i < maxFiles; i++) {
         const file = files[i];
         const reader = new FileReader();
        
         reader.onload = (e) => {
           appendImage(previewContainer, e.target.result, cellSize);
         };
         reader.readAsDataURL(file);
       }
     });
   } else {
     console.log('Input element not found.');
   }

   // 既存の画像表示用	
  const existingImages = document.querySelectorAll('.existing-image');	
  if (existingImages.length > 0) {	
  const cellSize = 300;	
  const maxImages = 4;	
  const rows = Math.ceil(existingImages.length / 2);	
  const cols = existingImages.length < 2 ? 1 : 2;	
  setContainerStyle(previewContainer, cols, cellSize);	
  existingImages.forEach(input => {	
  const imageUrl = input.value;	
  appendImage(previewContainer, imageUrl, cellSize);	
  });	
    }

  // ポストの画像表示用
  const postContainers = document.querySelectorAll('.image-preview');

  postContainers.forEach(container => {
    const images = container.querySelectorAll('img');
    const maxImages = 4;
    const rows = Math.ceil(images.length / 2);
    const cols = images.length < 2 ? 1 : 2;
    const cellSize = 300;

    if (images.length > 0) {
      container.innerHTML = '';
      setContainerStyle(container, cols, cellSize);

      for (let i = 0; i < images.length && i < maxImages; i++) {
        const img = images[i];
        appendImage(container, img.src, cellSize);
      }
    }
  });
});