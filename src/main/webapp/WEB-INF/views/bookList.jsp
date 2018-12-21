<%@include file="templates/header.jsp"%>


<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <c:forEach items="${books}" var="book">
        <div class="col-lg-4">
            <img class="img-circle"
                 src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
                 alt="Generic placeholder image" width="140" height="140">
            <h2>${book.title}</h2>
            <h3>by: ${book.author}</h3>
            <p>${book.edition}th edition</p>
            <p>${book.description}</p>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal${book.id}">View details</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal${book.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">${book.title}</h4>
                        </div>
                        <div class="modal-body">
                            <%--<div class="container marketing">--%>
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
                                        <button type="button" class="btn btn-success btn-lg">Buy</button>
                                    </div>

                                <%--</div>--%>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>

        </div><!-- /.col-lg-4 -->
        </c:forEach>
    </div><!-- /.row -->



</div>

<!-- FOOTER -->
<%@include file="templates/footer.jsp"%>

