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
    <META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8">

    <div class="col-md-2"></div>
    <div class="col-md-8">
        <H2 class="align-center">Order form</H2>
        <form action="https://webto.salesforce.com/servlet/servlet.WebToCase?encoding=UTF-8"
              method="POST" autocomplete="off">

            <input type=hidden name="orgid" value="00D6F000002T87k">
            <input type=hidden name="retURL" value="https://pizza-force.herokuapp.com/">
            <input type="hidden" id="subject" maxlength="80" name="subject" size="20"
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
                <label for="description">Description: <span class="red">*</span></label>
                <textarea class="form-control" name="description"></textarea>
            </div>

            <div class="form-row">
                <div class="col-sm-6">
                    <label for="dish">Dish:</label>
                    <select name="dish" class="form-control">
                        <#list model["dishes"] as dish>
                            <option value="${dish.name} ${dish.id}">
                                ${dish.name}
                            </option>
                        </#list>
                    </select>
                </div>

                <div class="col-sm-2">
                    <label for="dish">Quantity:</label>
                    <input name="quantity" type="number" class="form-control" value="1"
                           placeholder="Type in quantity...">
                </div>

                <span class="input-group-btn">
                <button class="btn btn-success btn-add" type="button">
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
                </span>
                <br/>

            </div>

        <input type="submit" class="btn btn-primary" name="submit">
        <#--<span class="input-group-btn">-->

        </form>
    </div>

    <div class="col-md-2"></div>
</div>


<div class="container">
    <div class="row">
        <div class="col-xs-offset-3 col-xs-6">
            <form>
                <div class="form-group">
                    <div class="form-group input-group">
                        <select name="multiple[]" class="form-control">
                            <option value="">Пункт 1</option>
                            <option value="">Пункт 2</option>
                            <option value="">Пункт 3</option>
                        </select>
                        <span class="input-group-btn"><button type="button" class="btn btn-success btn-add">✚</button></span>
                    </div>
                </div>
            </form>
        </div>
    </div>
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
<#--<script>
    $(document).on('click', '.btn-add', function (event) {
        event.preventDefault();

        var field = $(this).closest('.form-row');
        var field_new = field.clone();

        $(this)
                .toggleClass('btn-success')
                .toggleClass('btn-add')
                .toggleClass('btn-danger')
                .toggleClass('btn-remove')
                .html('✖');

        field_new.find('input').val('');
        field_new.insertAfter(field);
    });

    $(document).on('click', '.btn-remove', function (event) {
        event.preventDefault();
        $(this).closest('.form-row').remove();
    });
</script>-->

<script>
    $(document).on('click', '.btn-add', function(event) {
        event.preventDefault();

        var field = $(this).closest('.form-group');
        var field_new = field.clone();

        $(this)
                .toggleClass('btn-success')
                .toggleClass('btn-add')
                .toggleClass('btn-danger')
                .toggleClass('btn-remove')
                .html('✖');

        field_new.find('input').val('');
        field_new.insertAfter(field);
    });

    $(document).on('click', '.btn-remove', function(event) {
        event.preventDefault();
        $(this).closest('.form-group').remove();
    });
</script>
</body>
</html>
