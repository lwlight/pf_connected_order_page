<!DOCTYPE html>
<head>
    <title>Pizza Force order page</title>
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/stylesheets/main.css"/>
</head>

<body>

<div class="jumbotron text-center">
    <div class="container">
        <h1 class="white">Pizza Force</h1>
        <p class="white">The toughest pizza on Salesforce!</p>
    </div>
</div>
<div class="container">
    <#--<META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8">-->

    <div class="col-md-2"></div>
    <div class="col-md-8">
        <H2 class="align-center">Order form</H2>
        <#if model["message"]??>
            <div class="alert-success" role="alert" align="center">${model["message"]}</div>
        </#if>
        <form action="https://webto.salesforce.com/servlet/servlet.WebToCase?encoding=UTF-8"
              method="POST" autocomplete="off" name="orderForm">

            <input type=hidden name="orgid" value="00D6F000002T87k">
            <input type=hidden name="retURL" value="https://pf-connected-order-page.herokuapp.com/thanks">
            <input type=hidden id="subject" maxlength="80" name="subject" size="20"
                   value="Order from pizza-force.herokuapp.com"/><br>

            <div class="form-group">
                <label for="name">Name: <span class="red">*</span></label>
                <input class="form-control" id="name" maxlength="80" name="name" size="20" type="text"
                       placeholder="John Snow" required="" pattern="^[A-Z][a-z]+\s[A-Z][a-z]+$"
                       title="Example: John Dou"/>
            </div>

            <div class="form-group">
                <label for="email">Email: <span class="red">*</span></label>
                <input class="form-control" id="email" maxlength="80" name="email" size="20" type="text"
                       placeholder="john_snow@gmail.com" required=""/>
            </div>
            <div class="form-group">
                <label for="phone">Phone: <span class="red">*</span></label>
                <input class="form-control" id="phone" maxlength="40" name="phone" size="20" type="text"
                       placeholder="+375291234567" required=""/>
            </div>

            <div class="form-group">
                <label for="00N6F00000OenDs">Delivery Address: <span class="red">*</span></label>
                <input id="00N6F00000OenDs" class="form-control" maxlength="255" name="00N6F00000OenDs" size="20"
                       type="text"/>
            </div>

            <div class="form-group">
                <label for="00N6F00000PnpLO">Comment: </label>
                <textarea class="form-control" id="00N6F00000PnpLO" name="00N6F00000PnpLO" type="text"
                          wrap="soft"></textarea>
            </div>

            <div class="form-row">
                <div class="col-6">
                    <label for="dish">Dish:</label>
                    <select name="dish" class="form-control">
                        <#list model["dishes"] as dish>
                            <option value="${dish.name}---${dish.id}">
                                ${dish.name}
                            </option>
                        </#list>
                    </select>
                </div>

                <div class="col">
                    <label for="quantity">Quantity:</label>
                    <input name="quantity" type="number" class="form-control">
                </div>

                <div class="col">
                <#--<span class="btn-group-sm">-->
                <button class="btn btn-success btn-add" type="button">
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
                <#--</span>-->
                </div>

            </div>

            <input type=hidden class="form-control" id="description" name="description" value="">

            <br>
            <br>
            <div class="form-group">
                <input class="btn btn-primary" value="Make the order" onclick="concatFields()" type="button">
            </div>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>

<div class="pf-bottom">
    <div class="container">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <span>&copy;Pizza-force</span>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<script type="text/javascript" src="http://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/order-script.js"></script>

</body>
</html>
