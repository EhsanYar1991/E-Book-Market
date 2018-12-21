<div class="row">
    <div class="col-md-5">
        <img src="#" alt="image" style="width: 100%;height: 300px"/>
    </div>
    <div class="col-md-5">
        <h3>${book.title}</h3>
        <p>Author: ${book.author}</p>
        <p>Description: ${book.description}</p>
        <p>ISBN: ${book.isbn}</p>
        <p>Edition: ${book.edition}th</p>
        <p>${book.numberOfPages} page</p>
        <h4>${book.price} $</h4>
        <a href="<c:url value="/resources/book_files/${book.title}_${book.id}.pdf"/>"><button type="button" class="btn btn-success btn-lg">DOWNLOAD</button></a>

    </div>
</div>