-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 19, 2024 at 09:15 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Main'),
(2, 'Appetizer'),
(3, 'Side Dish'),
(4, 'Dessert');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`favorite_id`, `recipe_id`, `user_id`) VALUES
(2, 8, 11),
(3, 9, 11),
(6, 2, 11),
(10, 33, 11),
(11, 4, 11),
(12, 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `ingredient_name`) VALUES
(1, 'curry leaves'),
(2, 'chilli'),
(3, 'crab'),
(4, 'chilli powder'),
(5, 'yoghurt'),
(6, 'mint'),
(7, 'brown sugar'),
(8, 'caster sugar'),
(9, 'balsamic vinegar'),
(10, 'porridge'),
(11, 'mustard seeds'),
(12, 'almond milk'),
(13, 'english mustard'),
(14, 'cape gooseberries'),
(15, 'digestive biscuit'),
(16, 'harissa'),
(17, 'vanilla essence'),
(18, 'paprika'),
(19, 'pink fir apple'),
(20, 'fennel seeds'),
(21, 'hazelnut'),
(22, 'sesame seeds'),
(23, 'pea'),
(24, 'chicken stock'),
(25, 'maple syrup'),
(26, 'sugar'),
(27, 'walnut'),
(28, 'chocolate'),
(29, 'ginger ground'),
(30, 'flaked almonds'),
(31, 'green bean'),
(32, 'icing sugar'),
(33, 'golden syrup'),
(34, 'lemon juice'),
(35, 'sherry vinegar'),
(36, 'spring onion'),
(37, 'rum'),
(38, 'lemon'),
(39, 'passata'),
(40, 'smoked paprika'),
(41, 'basmati rice'),
(42, 'tomato'),
(43, 'cocoa'),
(44, 'chopped tomatoes'),
(45, 'bay leaf'),
(46, 'salad leaves'),
(47, 'thyme'),
(48, 'preserved lemons'),
(49, 'nachos'),
(50, 'bacon'),
(51, 'red wine vinegar'),
(52, 'strawberry'),
(53, 'dijon mustard'),
(54, 'wholemeal flour'),
(55, 'rocket'),
(56, 'bicarbonate of soda'),
(57, 'courgette'),
(58, 'basil'),
(59, 'tarragon'),
(60, 'pork shoulder'),
(61, 'cauliflower'),
(62, 'cranberry'),
(63, 'oyster mushroom'),
(64, 'chickpea'),
(65, 'coconut cream'),
(66, 'potato'),
(67, 'salmon'),
(68, 'onion'),
(69, 'allspice'),
(70, 'spinach'),
(71, 'pine nut'),
(72, 'self-raising flour'),
(73, 'lamb'),
(74, 'cinnamon'),
(75, 'cloves'),
(76, 'chicken'),
(77, 'gelatine'),
(78, 'oregano'),
(79, 'condensed milk'),
(80, 'egg'),
(81, 'pepper'),
(82, 'dried chilli'),
(83, 'mango chutney'),
(84, 'sourdough bread'),
(85, 'feta cheese'),
(86, 'mixed spice'),
(87, 'passion fruit'),
(88, 'rice'),
(89, 'flour'),
(90, 'lime'),
(91, 'white wine'),
(92, 'sausage'),
(93, 'filo pastry'),
(94, 'coconut oil'),
(95, 'white cabbage'),
(96, 'salt'),
(97, 'mushroom'),
(98, 'butter'),
(99, 'red wine'),
(100, 'ginger'),
(101, 'saffron'),
(102, 'olive oil'),
(103, 'blueberry'),
(104, 'new potatoes'),
(105, 'peppercorn'),
(106, 'parmesan cheese'),
(107, 'breadcrumbs'),
(108, 'gravy browning'),
(109, 'white wine vinegar'),
(110, 'olive'),
(111, 'egg white'),
(112, 'pitta bread'),
(113, 'vinegar'),
(114, 'tabasco'),
(115, 'celery'),
(116, 'spaghetti'),
(117, 'coriander fresh'),
(118, 'raspberry'),
(119, 'coconut milk'),
(120, 'vanilla extract'),
(121, 'garam masala'),
(122, 'vegetable oil'),
(123, 'garlic'),
(124, 'red onion'),
(125, 'worcestershire sauce'),
(126, 'amchoor'),
(127, 'redcurrant jelly'),
(128, 'black treacle'),
(129, 'double cream'),
(130, 'demerara sugar'),
(131, 'vegetable stock'),
(132, 'sea salt'),
(133, 'butternut squash'),
(134, 'pomegranate'),
(135, 'coriander'),
(136, 'cheddar cheese'),
(137, 'banana'),
(138, 'couscous'),
(139, 'raisins'),
(140, 'sweet potato'),
(141, 'stem ginger'),
(142, 'cornflour'),
(143, 'black pepper'),
(144, 'almond'),
(145, 'parsley'),
(146, 'cardamom'),
(147, 'mango'),
(148, 'turmeric'),
(149, 'pear'),
(150, 'lamb neck'),
(151, 'tahini'),
(152, 'milk'),
(153, 'sunflower oil'),
(154, 'cream cheese'),
(155, 'pistachio'),
(156, 'plain flour'),
(157, 'plum'),
(158, 'carrot'),
(159, 'cumin'),
(160, 'baking powder'),
(161, 'oil');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(11) NOT NULL,
  `recipe_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `preparation_time` text DEFAULT NULL,
  `cooking_time` text DEFAULT NULL,
  `instructions_steps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`instructions_steps`)),
  `category_id` int(11) DEFAULT NULL,
  `avg_rating` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `recipe_name`, `description`, `preparation_time`, `cooking_time`, `instructions_steps`, `category_id`, `avg_rating`, `image_path`) VALUES
(1, 'Healthy pizza', 'No yeast required for this easy, healthy pizza, topped with colourful vegetables that\'s ready in 30 minutes.This is a great recipe if you want to feed the kids in a hurry!', 'less than 30 mins', '10 to 30 mins', '[\"Preheat the oven to 220C/200C Fan/Gas 7.\", \"To prepare the topping, put the pepper, courgette, red onion and oil in a bowl, season with lots of black pepper and mix together. Scatter the vegetables over a large baking tray and roast for 15 minutes.\", \"Meanwhile, make the pizza base. Mix the flour and salt in a large bowl. Add the yoghurt and 1 tablespoon of cold water and mix with a spoon, then use your hands to form a soft, spongy dough. Turn out onto a lightly floured surface and knead for about 1 minute.\", \"Using a floured rolling pin, roll the dough into a roughly oval shape, approx. 3mm/âin thick, turning regularly. (Ideally, the pizza should be around 30cm/12in long and 20cm/8in wide, but it doesnât matter if the shape is uneven, it just needs to fit onto the same baking tray that the vegetables were cooked on.)\", \"Transfer the roasted vegetables to a bowl. Slide the pizza dough onto the baking tray and bake for 5 minutes. Take the tray out of the oven and turn the dough over.\", \"For the tomato sauce, mix the passata with the oregano and spread over the dough. Top with the roasted vegetables, sprinkle with the chilli flakes and then the cheese. Bake the pizza for a further 8â10 minutes, or until the dough is cooked through and the cheese beginning to brown.\", \"Season with black pepper, drizzle with a slurp of olive oil and, if you like, scatter fresh basil leaves on top just before serving.\"]', 1, NULL, 'images/recipes_images/healthy_pizza.jpg'),
(2, 'Spaghetti Bolognese', 'Once you\'ve got this grown-up spag bol going the hob will do the rest. Any leftovers will taste even better the next day.', 'less than 30 mins', '1 to 2 hours', '[\"Heat the oil in a large, heavy-based saucepan and fry the bacon until golden over a medium heat. Add the onions and garlic, frying until softened. Increase the heat and add the minced beef. Fry it until it has browned, breaking down any chunks of meat with a wooden spoon. Pour in the wine and boil until it has reduced in volume by about a third. Reduce the temperature and stir in the tomatoes, drained mushrooms, bay leaves, oregano, thyme and balsamic vinegar.\", \"Either blitz the sun-dried tomatoes in a small blender with a little of the oil to loosen, or just finely chop before adding to the pan. Season well with salt and pepper. Cover with a lid and simmer the Bolognese sauce over a gentle heat for 1-1Â½ hours until it\'s rich and thickened, stirring occasionally. At the end of the cooking time, stir in the basil and add any extra seasoning if necessary.\", \"Remove from the heat to \'settle\' while you cook the spaghetti in plenty of boiling salted water (for the time stated on the packet). Drain and divide between warmed plates. Scatter a little parmesan over the spaghetti before adding a good ladleful of the Bolognese sauce, finishing with a scattering of more cheese and a twist of black pepper.\"]', 1, NULL, 'images/recipes_images/spaghetti_bolognese.jpg'),
(3, 'Vegan pancakes', 'Try this vegan fluffy American pancake recipe for a perfect start to the day. Serve these pancakes with fresh berries, maple syrup or chocolate sauce for a really luxurious start to the day.', 'less than 30 mins', '10 to 30 mins', '[\"Put the flour, sugar, baking powder and salt in a bowl and mix thoroughly. Add the milk and vanilla extract and mix with a whisk until smooth.\", \"Place a large non-stick frying pan over a medium heat. Add 2 teaspoons of the oil and wipe around the pan with a heatproof brush or carefully using a thick wad of kitchen paper.\", \"Once the pan is hot, pour a small ladleful (around two dessert spoons) of the batter into one side of the pan and spread with the back of the spoon until around 10cm/4in in diameter. Make a second pancake in exactly the same way, greasing the pan with the remaining oil before adding the batter.\", \"Cook for about a minute, or until bubbles are popping on the surface and just the edges look dry and slightly shiny. Quickly and carefully flip over and cook on the other side for a further minute, or until light, fluffy and pale golden brown. If you turn the pancakes too late, they will be too set to rise evenly. You can always flip again if you need the first side to go a little browner.\", \"Transfer to a plate and keep warm in a single layer (so they donât get squished) on a baking tray in a low oven while the rest of the pancakes are cooked in exactly the same way. Serve with your preferred toppings.\"]', 4, NULL, 'images/recipes_images/vegan_pancakes.jpg'),
(4, 'Easy lamb biryani', 'This lamb biryani is real centrepiece dish, but it\'s actually easy as anything to make. Serve garnished with pomegranate seeds to make it look really special.', 'overnight', '1 to 2 hours', '[\"Heat the oil in a non-stick frying pan over a medium heat. Add the onions and stir-fry for 15â18 minutes, or until lightly browned and crispy.\", \"Put half the onions in a non-metallic mixing bowl with the yoghurt, ginger, garlic, chilli powder, cumin, cardamom, half of the salt, the lime juice, half of the chopped coriander and mint and the green chillies. Stir well to combine. Set aside the remaining coriander and mint for layering the biryani.\", \"Add the lamb to the mixture and stir to coat evenly. Cover and marinade in the fridge for 6â8 hours, or overnight if possible.\", \"Preheat the oven to 240C/Fan 220C/Gas 9.\", \"Heat the cream and milk in a small saucepan, add the saffron, remove from the heat and leave to infuse for 30 minutes.\", \"Cook the rice in a large saucepan in plenty of boiling water with the remaining salt for 6â8 minutes, or until it is just cooked, but still has a bite. Drain the rice.\", \"Spread half of the lamb mixture evenly in a wide, heavy-based casserole and cover with a layer of half the rice. Sprinkle over half of the reserved onions and half of the reserved coriander and mint. Sprinkle over half of the saffron mixture. Repeat with the remaining lamb, rice, onions, herbs and saffron mixture.\", \"Cover with a tight fitting lid, turn down the oven to 200C/Fan 180C/Gas 6 and cook for 1 hour. Remove and allow to stand for 15â20 minutes before serving. Garnish with pomegranate seeds if desired.\"]', 1, NULL, 'images/recipes_images/easy_lamb_biryani.jpg'),
(5, 'Couscous salad', 'A nutritious and satisfying vegan couscous salad packed with colour, flavour and texture, from dried cranberries, pistachios and pine nuts.', 'less than 30 mins', 'less than 10 mins', '[\"In a large bowl mix all the ingredients together except the rocket, then taste and adjust the seasoning, adding more salt if necessary. Toss in the rocket and serve immediately.\"]', 2, NULL, 'images/recipes_images/couscous_salad.jpg'),
(6, 'Plum clafoutis', 'Halved plums are covered in a light batter and then baked in the oven to make this traditional French dessert. British plums are at their best in September, so make the most of them then and try this simple pud.', 'less than 30 mins', '30 mins to 1 hour', '[\"Preheat the oven to 180C/350F/Gas 4.\", \"Pour the milk, cream and vanilla into a pan and boil for a minute. Remove from the heat and set aside to cool.\", \"Tip the eggs and sugar into a bowl and beat together until light and fluffy. Fold the flour into the mixture, a little at a time.\", \"Pour the cooled milk and cream onto the egg and sugar mixture, whisking lightly. Set aside.\", \"Place a little butter into an ovenproof dish and heat in the oven until foaming. Add the plums and brown sugar and bake for 5 minutes, then pour the batter into the dish and scatter with flaked almonds, if using.\", \"Cook in the oven for about 30 minutes, until golden-brown and set but still light and soft inside.\", \"Dust with icing sugar and serve immediately with cream.\"]', 4, NULL, 'images/recipes_images/plum_clafoutis.jpg'),
(7, 'Mango pie', 'This mouthwatering mango dessert is an Indian take on a traditional Thanksgiving pie.', '30 mins to 1 hour', '30 mins to 1 hour', '[\"To make the biscuit base, finely crush the biscuits by putting into a sealed plastic bag and bashing with a rolling pin (alternatively, pulse to crumbs using a food processor). Transfer to a mixing bowl and add the sugar, cardamom and salt, stirring well to combine.\", \"Pour the melted butter over the biscuit crumbs and mix, until thoroughly combined. Put half the crumb mixture in a 23cm/9in metal pie tin, and press evenly with your fingers. Build up the sides of the tin, compressing the base as much as possible to prevent it crumbling. Repeat with the rest of the mixture in the second tin.\", \"Preheat the oven to 160C/325F/Gas 3. Put the pie bases in the freezer for 15 minutes. Remove and bake for 12 minutes, or until golden brown. Transfer to a wire rack to cool.\", \"To make the filling, pour 177ml/6fl oz of cold water into a large bowl. In a separate bowl, mix the gelatine with half the sugar and sprinkle over the water. Leave to stand for a couple of minutes.\", \"Meanwhile, whip the cream with the remaining sugar to form medium stiff peaks. Set aside.\", \"Heat about a quarter of the mango pulp in a saucepan over a medium-low heat, until just warm. Make sure you do not boil it. Pour into the gelatine mixture and whisk, until well combined. The gelatine should dissolve completely. Gradually whisk in the remaining mango pulp.\", \"Beat the cream cheese in a bowl, until soft and smooth. Add to the mango mixture with the salt. Blend the mixture using a hand blender, until completely smooth. Gently tap the bowl on the kitchen counter once or twice to pop any air bubbles.\", \"Fold about a quarter of the mango mixture into the whipped cream using a spatula. Repeat with the rest of the cream, until no streaks remain.\", \"Divide the filling between the cooled bases, using a rubber spatula to smooth out the filling. Refrigerate overnight, or for at least 5 hours, until firm and chilled.\"]', 4, NULL, 'images/recipes_images/mango_pie.jpg'),
(8, 'Mushroom doner', 'A meat-free mushroom doner kebab packed with two types of sauces, pickles and veg. A mighty delicious vegetarian dish.', 'less than 30 mins', '10 to 30 mins', '[\"Preheat the oven to 180C/200C Fan/Gas 4.\", \"To make the chilli sauce, heat the chopped tomatoes, rose harissa, sugar and lemon juice in a small saucepan over a medium heat. Bring to a gentle boil and cook for 10 minutes, stirring regularly, until reduced to a thick sauce-like consistency. Remove from the heat and set aside to cool. You can blend the sauce until it\'s smooth using a hand-blender if you like, or just leave it chunky.\", \"For the onion, mix together the onion slices, vinegar and parsley and set aside.\", \"To make the yoghurt sauce, mix the yoghurt with the dried mint, season with salt and pepper and set aside.\", \"Put the pittas in the oven to warm for 5 minutes.\", \"To make the \'doner,\' heat a frying pan over a medium-high heat. Add the mushrooms and dry-fry for 2 minutes, stirring once or twice. Add the garlic oil, paprika, coriander, celery salt, garlic granules and black pepper and quickly coat the mushrooms. Add 2â3 tablespoons of water to the pan and stir-fry for 1 minute before removing from the heat.\", \"Split the warmed pitta breads. Spoon a little white cabbage into each pitta and add a little tomato and onion. Divide the mushrooms between the pittas, add a little more cabbage and tomato, then drizzle with the chilli and yoghurt sauces. Serve immediately, topped with the pickled chillies, if using.\"]', 3, NULL, 'images/recipes_images/mushroom_doner.jpg'),
(9, 'Easy chocolate cake', 'Our really easy chocolate cake recipe is perfect for birthdays. Itâs so moist, dark and decadent and will keep well for 4â5 days. For buttercream quantities, instead of ganache, use our', 'less than 30 mins', '30 mins to 1 hour', '[\"Preheat the oven to 180C/160C Fan/Gas 4. Grease and line two 20cm/8in sandwich tins.\", \"For the cake, place all of the cake ingredients, except the boiling water, into a large mixing bowl. Using a wooden spoon, or electric whisk, beat the mixture until smooth and well combined.\", \"Add the boiling water to the mixture, a little at a time, until smooth. (The cake mixture will now be very liquid.)\", \"Divide the cake batter between the sandwich tins and bake in the oven for 25â35 minutes, or until the top is firm to the touch and a skewer inserted into the centre of the cake comes out clean.\", \"Remove the cakes from the oven and allow to cool completely, still in their tins, before icing.\", \"For the chocolate icing, heat the chocolate and cream in a saucepan over a low heat until the chocolate melts. Remove the pan from the heat and whisk the mixture until smooth, glossy and thickened. Set aside to cool for 1â2 hours, or until thick enough to spread over the cake.\", \"To assemble the cake, run a round-bladed knife around the inside of the cake tins to loosen the cakes. Carefully remove the cakes from the tins.\", \"Spread a little chocolate icing over the top of one of the chocolate cakes, then carefully top with the other cake.\", \"Transfer the cake to a serving plate and ice the cake all over with the chocolate icing, using a palette knife.\"]', 4, NULL, 'images/recipes_images/easy_chocolate_cake.jpg'),
(10, 'Roast chicken with tarragon butter and melting onions', 'A roast chicken seems to me to be the ultimate comfort meal for all the family. And itâs so versatile: serve as a classic Sunday dinner with roast potatoes, or with a selection of salads or side dishes.', 'less than 30 mins', '1 to 2 hours', '[\"Preheat the oven to 200C/180C Fan/Gas 6.\", \"Mix the butter, garlic, ginger, tarragon and lemon zest in a small bowl; season with salt and pepper.\", \"Loosen the skin of the chicken breast by gently pushing your fingers between the skin and the meat, taking care not to break the skin. Using your hand, spread the butter under the skin in an even layer.\", \"Transfer the chicken to a roasting tin and scatter the onions around it. Rub a little oil over the skin and legs, and season.\", \"Roast for about 1Â½ hours, or until the chicken is cooked. The chicken is cooked through when the juices run clear with no trace of pink when the thickest part of the leg, between the drumstick and the thigh, is pierced with a skewer. Transfer to a board to rest. Remove the onions to a hot serving bowl.\", \"To make the gravy, sprinkle the flour over the fat in the roasting tin and whisk until combined. Pour in the wine and stock and whisk over a medium heat until thickened and smooth. Whisk in the redcurrant jelly, Worcestershire sauce and gravy browning, if using. Pour through a sieve into a jug, stir in the tarragon and season with salt and pepper.\", \"Carve the chicken and serve with the onions and gravy.\"]', 1, NULL, 'images/recipes_images/roast_chicken.jpg'),
(11, 'Lamb curry', 'James Martin\'s easy lamb curry is an aromatic mix of fresh ginger, spices and coconut milk. Use cheaper neck fillets and slow cook them to perfection.', 'less than 30 mins', '1 to 2 hours', '[\"Heat a large saucepan and add one tablespoon of the vegetable oil and then the lamb. Cook over a high heat for 3-4 minutes, or until the lamb is golden-brown all over, then remove and set aside.\", \"Reduce the heat and add the remaining tablespoon of vegetable oil. Add the onions, garlic, chillies and ginger and fry for 2-3 minutes, until golden-brown and softened.\", \"Add all the turmeric, garam masala, cumin and chilli powder and fry, stirring well, for one minute. Add the tomatoes and coconut milk and heat to bring to a simmer. Stir well, scraping the bottom of the pan to deglaze and release any residue at the bottom of the pan. Add the lamb and enough chicken stock to just cover the lamb.\", \"Heat the mixture until simmering, then partially cover and cook on a low heat for about one hour, or until the lamb is tender.\", \"Skim off any excess fat from the surface of the sauce, then add the spinach. Cook for 1-2 minutes, until the spinach has wilted.\", \"Add the yoghurt, season, to taste, with salt and freshly ground black pepper and stir well.\", \"Serve onto warmed plates with steamed basmati rice alongside.\"]', 1, NULL, 'images/recipes_images/lamb_curry.jpg'),
(12, 'Easy samosas', 'An easy little vegetable samosa recipe that makes a delicious, inexpensive lunch from storecupboard ingredients. They freeze brilliantly too, so you can batch cook and have them when you need them.', 'less than 30 mins', '30 mins to 1 hour', '[\"Heat the oil in a small non-stick pan and fry the mustard seeds for about ten seconds, or until they begin to splutter.\", \"Add the onion and ginger and cook for 2-3 minutes over a high heat. Add the peas, stir well and add the spices, mango powder, salt and a splash of water. (If using lemon juice, add this instead of the water.) Cook for 1-2 minutes, then add the potatoes and coriander and cook for 2-3 minutes. Taste and adjust the seasoning.\", \"Preheat the oven to 200C/400F/Gas 6.\", \"Unroll the pastry and cover with cling film and a damp tea towel. Peel off one piece and keep the rest covered so that it doesn\'t dry out. Lay the pastry sheet flat on a clean surface and brush with melted butter. Fold in one third of the pastry lengthways towards the middle. Brush again with the butter and fold in the other side to make a long triple-layered strip.\", \"Place one rounded teaspoon of the filling mixture at one end of the strip, leaving a 2cm/1in border. Take the right corner and fold diagonally to the left, enclosing the filling and forming a triangle. Fold again along the upper crease of the triangle. Keep folding in this way until you reach the end of the strip. Brush the outer surface with more butter. Place onto a baking sheet and cover while you make the rest of the samosas. Sprinkle over a few sesame seeds, if using.\", \"Bake in the centre of the oven for 30-35 minutes, or until golden and crisp, turning halfway through the cooking time.\", \"To serve, place the samosas onto a large serving plate with a bowlful of chutney.\"]', 2, NULL, 'images/recipes_images/easy_samosas.jpg'),
(13, 'Courgette fritters', 'Courgette fritters are an easy, cheap and quick vegetarian lunch or dinner. This recipe uses peas and cumin, but you can use whatever vegetables and spices you have.', 'less than 30 mins', 'less than 10 mins', '[\"Season the courgette with sea salt and set aside.\", \"Whisk together the egg, baking powder, flour and cumin in a large bowl and season with black pepper.\", \"Squeeze the excess water out of the courgette over the sink, then add the courgette and peas to the batter.\", \"Heat enough oil to just cover the bottom of a large frying pan, over a medium-high heat. When the oil just shimmers, drop in heaped tablespoons of the courgette mixture, flattening them with the back of the spoon to make fritters. Fry each one for 1â2 minutes, or until golden-brown on each side. If you need to cook in batches in a smaller pan, set the fritters to drain on a plate lined with kitchen paper.\", \"To make the dip, stir together the yoghurt and mango chutney in a small bowl.\", \"Serve the fritters with the yoghurt.\"]', 2, NULL, 'images/recipes_images/courgette_fritters.jpg'),
(14, 'Sweet potato soup', 'Sweet potato soup is a big bowl of comfort. It\'s vegan, has cheap ingredients, is quick and easy to make. It can also be frozen for future lunches and dinners. Perfection!', 'less than 30 mins', '10 to 30 mins', '[\"Heat the oil in a large, lidded saucepan over a medium-high heat. Add the onion and carrots and cook until softened. Stir in the ginger, garlic and chilli flakes and fry for 2â3 minutes, or until fragrant.\", \"Stir in the sweet potatoes and stock. Turn up the heat and bring the pan to the boil. Reduce the heat to low and simmer with the lid on for 15 minutes, or until the sweet potato is tender.\", \"Remove the pan from the heat and blend the soup, using a stick blender, until smooth. Alternatively, tip it into a food processor and blend. Season to taste and serve.\"]', 3, NULL, 'images/recipes_images/sweet_potato_soup.jpg'),
(15, 'Baked aloo gobi with flatbreads', 'This vegetarian whole-baked cauliflower and potato curry can also be made suitable for vegans.', 'less than 30 mins', '1 to 2 hours', '[\"For the aloo gobi, using a sharp pair of kitchen scissors, cut the large leaves and stalks away from the outside of the cauliflower. You can leave the smaller leaves close to the florets â they will go nice and crispy when roasted. Turn the cauliflower upside down and, using a small paring knife, carefully cut a hollow in the middle of the central stalk to help the cauliflower cook evenly. Take a casserole or lidded saucepan and half-fill it with water from the kettle and bring to the boil. Add salt to the pan, add the cauliflower, cover and simmer for 6 minutes. Drain the cauliflower and return to the pan off the heat, put the lid back on and leave the cauliflower to steam for 10 minutes.\", \"Meanwhile, take another casserole dish and place over a medium heat. Heat the coconut oil , then add the ginger, chillies and garlic and cook for a few minutes, until fragrant. Stir in the mustard seeds and continue cooking until the garlic has softened. Add the turmeric and a big pinch of salt.\", \"Preheat the oven to 220C/200C Fan/Gas 7.\", \"Pour the coconut milk into the casserole dish, stir well and season with a little pepper. Place the steamed cauliflower in a colander to drain off any water. When the milk starts to bubble gently, turn off the heat and place the cauliflower in the dish, then baste it with the coconut-spice mixture. Add the lemon halves to the dish and scatter the potatoes around the cauliflower so they sit in the coconut milk.\", \"Bake in the oven, basting the cauliflower occasionally with the sauce in the dish, for 40â45 minutes. You want it to catch a little on top. To test if the cauliflower is cooked, insert a small sharp knife into the middle â it should be really tender and the potatoes and cauliflower should have soaked up most of the sauce. Carefully remove the lemons and leave to cool slightly before squeezing them over the aloo gobi. Transfer the aloo gobi to a serving dish.\", \"While the aloo gobi is baking, prepare the flatbreads. Place the flour, baking powder and yoghurt in the bowl of a food processor and pulse until the mixture forms a ball. If you donât have a food processor, this can be done in a bowl using a fork to begin with, followed by your hands.\", \"Tip the dough out on a clean work surface that is lightly dusted with flour. Knead for a minute or two. Put the dough into a flour-dusted bowl and cover with a plate. Leave to rise for 10â15 minutes. It wonât rise like normal dough, but it may puff up slightly.\", \"Dust a clean work surface and rolling pin with flour and divide the dough into four equal pieces. Using your hands, pat and flatten out the dough and then use the rolling pin to roll each piece into a circle that is roughly 20cm/8in in diameter and 2â3mm thick.\", \"Place a large frying pan or griddle pan that is slightly larger than your flatbreads over a medium heat. Once hot, cook each flatbread for 1â2 minutes on each side, turning with tongs, until nicely puffed up.\", \"Serve the aloo gobi with the yoghurt, almonds, coriander and flatbreads, if using.\"]', 2, NULL, 'images/recipes_images/baked_aloo_gobi.jpg'),
(16, 'Cauliflower cheese', 'A simple and delicious cauliflower cheese recipe, a classic comfort food. This also makes a wonderful accompaniment to a vegetarian roast.', 'less than 30 mins', '30 mins to 1 hour', '[\"Preheat the oven to 190C/170C Fan/Gas 5.\", \"Wash the cauliflower thoroughly and place in a large saucepan of salted water. Bring to the boil and cook for 3/5 minutes, until the cauliflower is almost tender, but still fairly firm. Tip into a colander and leave to drain.\", \"To make the sauce, melt the butter in a heavy-based saucepan and stir in the flour. Cook over a gentle heat for 1 minute. Remove the pan from the heat and gradually add the milk, a little at a time, stirring well between each addition.\", \"Return the pan to a medium heat and bring the mixture to the boil, stirring constantly. Simmer for 2 minutes, then remove from the heat.\", \"Stir in the mustard and two thirds of the cheese and set aside.\", \"Arrange the cauliflower in an ovenproof baking dish. Carefully pour over the sauce, ensuring the cauliflower is completely covered. Scatter over the remaining cheese and bake for 25/30 minutes, until the top is golden brown and bubbling.\"]', 3, NULL, 'images/recipes_images/cauliflower_cheese.jpg'),
(17, 'Green pea dip with nachos', 'This easy dip is great for impromptu parties when you only have your store cupboard to rely on!', 'less than 30 mins', 'no cooking required', '[\"Place the peas, onion, garlic and mint leaves into a food processor and blend to a thick purÃ©e.\", \"Add the yoghurt and blend again, leaving the mixture slightly lumpy.\", \"Transfer the mixture to a bowl and stir in the chilli, cumin, coriander and lime juice and season, to taste, with salt and freshly ground black pepper.\", \"Spoon into a serving bowl and drizzle with the olive oil. Serve with a bowl of nachos alongside for dipping.\"]', 2, NULL, 'images/recipes_images/green_pea_dip.jpg'),
(18, 'Grilled salmon Nicoise', 'Take an easy twist on the classic French salad nicoise using fresh seared salmon and a luscious homemade dressing.', 'less than 30 mins', '10 to 30 mins', '[\"Discard the skin of the salmon, and cut it into 4 equal steaks.  Sprinkle each steak with salt and black pepper, pressing it firmly into the steaks with your hand. Coat lightly in oil, and refrigerate until ready to cook.\", \"Rub the yellow pepper with a little vegetable oil, and grill or roast until the skin is well blistered.  Allow to cool, and then peel off the charred skin, remove the seeds, slice into 8 pieces, and place in a bowl. Cut the tomatoes into 6 wedges each, and slice the new potatoes if they seem very large.\", \"Combine all the vegetables, season lightly with salt and pepper, and toss with the olive oil, and parsley. Leave to come to room temperature.\", \"To make the dressing, combine all the dressing ingredients in a blender, and pulse until smooth and emulsified.\", \"To cook the salmon, heat a large grill pan, (preferably cast iron) over high heat until almost smoking.  Add the salmon, and sear for 1-3 minutes on each side.\", \"To serve, divide the vegetables among the plates, and place a salmon steak in the centre of each.  Surround with a generous drizzle of the dressing, and serve at once.\"]', 1, NULL, 'images/recipes_images/grilled_salmon.jpg'),
(19, 'Goat cheese salad', 'A simple and adaptable recipe to make salad a satisfying main meal. The key is getting the right balance of flavours and texture. Choose a mixture of salad leaves and swap the cheese for the protein of your choice.', 'less than 30 mins', 'less than 10 mins', '[\"In a salad bowl, mix the red onion, tarragon, vinegar and olive oil. Season with salt and pepper and set aside.\", \"Heat a little oil in a frying pan, add the bacon and fry until crisp. Drain on kitchen paper.\", \"Heat the grill to high. Toast the bread on both sides and grill the goat cheese until golden-brown and bubbling.\", \"Add the hazelnuts, bacon and salad leaves to the bowl.\", \"Place the goatsâ cheese on the toast and toss the salad making sure it is well coated with dressing.\", \"Arrange on a plate and serve.\"]', 3, NULL, 'images/recipes_images/goats_cheese_salad.jpg'),
(20, 'Chickpea salad', 'Add a portion of this chickpea salad to your lunchbox and ditch the disappointing sandwiches. With feta, spinach and roasted peppers, it\'s got tons of flavour and keeps well.  Add some nice bread to soak up the dressing if you wish.', 'less than 30 mins', 'no cooking required', '[\"Combine the chickpeas, tomatoes, roasted peppers and spinach in a large mixing bowl. Sprinkle over the feta and basil leaves.\", \"For the dressing, whisk the olive oil, cider vinegar and lime juice together in a small bowl.\", \"Pour the dressing over the salad and gently toss the salad.\"]', 3, NULL, 'images/recipes_images/chickpea_salad.jpg'),
(21, 'Spanish-style tortilla', 'Tortillas make perfect picnic food and make a nice change to sandwiches for lunchboxes.', 'less than 30 mins', '10 to 30 mins', '[\"In a large, heavy-based frying pan, heat the butter and oil. Cook the onions slowly until transparent and soft.\", \"Add the potato slices and fry gently for two minutes.\", \"Stir in the spinach.\", \"Season the eggs with salt and freshly ground black pepper and pour onto the contents of the frying pan.\", \"Cook over a low to medium heat: it may take up to ten minutes until the egg is set enough to turn the tortilla over, and if the heat is too high, the bottom will burn before the middle is set.\", \"Once the bottom is nicely browned and the centre has set, it is time to turn it over. This is done with a  double flip: place a plate (or the bottom of a tart tin) over the pan and flip it over once, so that the cooked surface of the tortilla is on the bottom. Take another plate, and flip it again so the cooked surface is on the top. Then place the frying pan back over the tortilla plate and flip one more time, so the uncooked bit is now in contact with the base of the pan.\", \"Replace the pan over low heat until the tortilla is cooked through.\", \"Serve hot, warm or cold, cut into slices or cubes.\"]', 2, NULL, 'images/recipes_images/tortilla.jpg'),
(22, 'Carrot cake pakoras with cream cheese dip', 'Imagine a carrot cake with spices, nuts and raisins, but deep-fried and dusted with icing sugar. All served with a cool and sweet cream cheese dip.', 'less than 30 mins', '10 to 30 mins', '[\"For the cream cheese, mix the cream cheese and butter in a bowl until smooth and fully combined, with no lumps.\", \"Mix in the icing sugar, maple syrup and salt, then transfer into a serving bowl. Drizzle over a squirt of maple syrup and sprinkle with a pinch of mixed spice. Cover the bowl and pop into the fridge.\", \"For the pakoras, have a baking tray lined with kitchen paper ready to soak up any excess oil.\", \"Put a medium pan (one that has a lid, in case you need to put the lid on in an emergency) on a high heat and add about 1.5 litres/2Â½ pints of oil, though this depends on the size of the pan: the oil needs to be halfway up. (CAUTION: hot oil can be dangerous. Do not leave unattended.)\", \"Tip the carrots, walnuts and raisins into a mixing bowl. Mix well.\", \"Add the flour, baking powder, sugar, mixed spice and salt, and stir into the carrot mixture so that everything is coated. Add the beaten eggs and keep mixing until you have a thick batter.\", \"Test that the oil is hot enough by adding a tiny drop of the batter to the oil. If it sizzles and rises to the top, the oil is ready for frying. (If you own a cooking thermometer, it should be at 170C.) Turn the heat down to medium.\", \"Using two teaspoons, one to pick up and the other to push out, gently drop teaspoons of the mixture into the oil. Work in batches, making sure not to overcrowd the pan.\", \"Fry for a few minutes â these only take about 4â5 minutes. Move them around, turning them occasionally so that they are an even colour. They should be golden-brown on the outside.\", \"Carefully remove the pakoras from the oil with a slotted spoon and drain on the paper-covered tray.\", \"Fry more batches until all the batter is used up. Dust with the icing sugar and serve with the dip.\"]', 2, NULL, 'images/recipes_images/carrot_cake_pakoras.jpg'),
(23, 'Pear upside-down cake', 'This traditional upside-down pear cake is given a fiery twist with the addition of ginger and dark rum. Serve with ice cream as a dessert or by itself as a teatime treat.', 'less than 30 mins', '30 mins to 1 hour', '[\"Cut out a circle of baking paper that is roughly 2cm/Â¾in larger than the base of a 20cm/8in springform or loose-based round cake tin. Grease the sides of the tin and place the paper circle in the base, pressing up the sides slightly. This will help hold the caramel.\", \"For the pears, make a caramel by melting the sugar in small, deep saucepan over a low heat until golden brown, stirring only once most of the sugar has melted. (CAUTION: boiling sugar is extremely hot. Handle very carefully. Use a deep pan to avoid bubbling over.) Add the butter and stir with a long-handled wooden spoon very gently until melted. Take the pan off the heat and stir in the rum and ginger syrup until the sauce is smooth. Leave the caramel to stand for 15â20 minutes, or until it cools enough to coat the back of a spoon, stirring occasionally. Place a baking tray on the bottom of the oven to catch any caramel that leaks out of the cake tin and preheat the oven to 180C/160C Fan/Gas 4.\", \"While the caramel is cooling, peel the pears, cut into quarters and remove the cores. Cut each pear quarter into 3â4 long slices. Place the pear slices in the caramel and turn to coat. Arrange the pear slices in a fan shape in the bottom of the prepared cake tin.\", \"For the cake mixture, add all of the ingredients to a food processor and mix until smooth. Alternatively, place all of the ingredients in a large mixing bowl and beat with a wooden spoon until a smooth mixture is formed. Gently spoon the mixture over the pears and smooth the surface. Bake for 35â40 minutes, or until the cake is well risen, firm to the touch and a skewer comes out clean when inserted into the middle.\", \"Using oven gloves to protect your hands, carefully loosen and remove the sides of the cake tin. Place a serving plate over the cake and carefully turn over. Remove the tin base and baking paper. This needs to be done while the cake is warm otherwise the caramel will harden and the cake will be more difficult to remove.\", \"Slice and serve the cake warm with ice cream as a dessert or by itself as a teatime treat.\"]', 4, NULL, 'images/recipes_images/pear_upsidedown.jpg'),
(24, 'Hummus', 'This is a hummus recipe for those who like it really garlicky. Feel free to adjust to your own tastes,', 'less than 30 mins', 'less than 10 mins', '[\"Heat chickpeas and four tablespoons of water or vegetable stock in a saucepan.\", \"When warmed through, place the chickpeas and two tablespoons of the stock or water in a food processor. Blend until roughly combined. Add the garlic, tahini and lemon juice and a couple of large pinches of salt and blend again.\", \"Add the olive oil and blend again until hummus is the desired texture.\", \"Serve on a flat dish topped with a drizzle of olive oil, some parsley, fried pine nuts and a sprinkling of paprika.\"]', 2, NULL, 'images/recipes_images/hummus.jpg'),
(25, 'Crab cakes', 'Whip up delicious ginger and coriander-tinged crab cakes when youâre pressed for time.', 'less than 30 mins', '10 to 30 mins', '[\"Place the ginger and chilli into a mini food processor and pulse until finely chopped.\", \"In a bowl combine the chilli and ginger with the white crabmeat, coriander and spring onions. Crack in one egg and mix well, then stir in 4 tablespoons of the breadcrumbs.\", \"Divide the crab cake mixture into 6 equal portions and mould into patties. Place on a tray and chill in the fridge for about 20 minutes before cooking.\", \"Preheat the oven to 180C/160C Fan/Gas 4.\", \"Beat the remaining egg in a small bowl with one tablespoon of water to make an eggwash. Place some plain flour and the remaining breadcrumbs in separate shallow dishes.\", \"Dredge a crab cake in the flour, then dip into the egg  and coat in the breadcrumbs. Shake gently to remove any excess breadcrumbs. Repeat with the remaining crab cakes.\", \"Heat the olive oil in a frying pan and fry the crab cakes for 2-3 minutes on each side, or until crisp and golden-brown all over. Transfer the crab cakes to a baking tray and bake for 5-10 minutes, or until piping hot all the way through.\", \"Serve the crab cakes with sweet chilli jam and a mixed leaf salad, lightly dressed with olive oil, salt and freshly ground black pepper.\"]', 2, NULL, 'images/recipes_images/crab_cakes.jpg'),
(26, 'Scotch eggs', 'Homemade Scotch eggs are a world away from shop bought versions. They\'re worth the effort for a special picnic treat.', 'less than 30 mins', '10 to 30 mins', '[\"Place the eggs, still in their shells, in a pan of cold salted water.\", \"Place over a high heat and bring to the boil, then reduce the heat to simmer for exactly nine minutes.\", \"Drain and cool the eggs under cold running water, then peel.\", \"Mix the sausage meat with the thyme, parsley and spring onion in a bowl and season well with salt and freshly ground black pepper (Simon recommends being generous with the freshly ground black pepper).\", \"Divide the sausage meat mixture into four and flatten each out on a clean surface into ovals about 12.5cm/5in long and 7.5cm/3in at its widest point.\", \"Place the seasoned flour onto a plate, then dredge each boiled egg in the flour.\", \"Place each onto a sausage meat oval, then wrap the sausage meat around each egg. Make sure the coating is smooth and completely covers each egg.\", \"Dip each sausage meat-coated egg in the beaten egg, rolling to coat completely, then dip and roll into the breadcrumbs to completely cover.\", \"Heat the oil in a deep heavy-bottomed pan, until a breadcrumb sizzles and turns brown when dropped into it. (CAUTION: hot oil can be dangerous. Do not leave unattended.)\", \"Carefully place each scotch egg into the hot oil and deep-fry for 8-10 minutes, until golden and crisp and the sausage meat is completely cooked.\", \"Carefully remove from the oil with a slotted spoon and drain on kitchen paper.\", \"Serve cool.\"]', 2, NULL, 'images/recipes_images/scotch_eggs.jpg'),
(27, 'Easy fudge', 'This really easy fudge recipe makes soft, melt-in-the- mouth British-style fudge. A batch of super-creamy fudge makes a brilliant present for family and friends at birthdays and Christmas.', 'less than 30 mins', '10 to 30 mins', '[\"Line a 20cm/8inch square tin with baking paper. Place a glass of cold water in the freezer (or in the fridge with ice cubes).\", \"Place all of the ingredients, apart from the salt, into a large, dry saucepan over a low heat. Continuously stir until the butter has melted and the sugar has completely dissolved.\", \"Slowly bring the mixture to a rolling boil over a medium-high heat for 10 minutes. Stir continuously, especially around the edges, to stop the mixture catching on the bottom of the pan and burning. Be very careful as the mixture is very hot.\", \"Once the mixture has reduced and darkened, carefully dip a teaspoon into the mixture and drizzle it into your glass of iced water (remove the ice cubes if using.) It should become a soft, pliable ball you can squash with your fingers when dropped into the iced water. If it sticks to the glass or your fingers when you press it, continue to boil and test the mixture every 2â3 minutes, or until it passes the test.\", \"Add a pinch of salt then beat the mixture well. Leave to cool in the saucepan for 10 minutes. Beat the thickened mixture again, breaking the top that will have started to set until it starts to lose its shine. Leave for another 5 minutes and beat again. Pour into the lined tin and level with the back of a spoon.\", \"Refrigerate for at least 3 hours, or until completely firm and you can cut through it easily with a knife without it getting stuck. Remove the fudge from the tin, transfer to a chopping board and slice into 36 pieces (6x6) with a sharp knife.\"]', 4, NULL, 'images/recipes_images/easy_fudge.jpg'),
(28, 'Pavlova', 'The Hairy Bikers\' pavlova recipe uses ripe summer strawberries, but you can try making it with stewed fruits in winter. Pavlova is a great make-ahead dessert that\'s gluten-free, too.', 'less than 30 mins', 'over 2 hours', '[\"Preheat the oven to 150C/Fan 130F/Gas 2. Place a 25cm/10in dinner plate on a sheet of baking parchment and draw around it.\", \"Put the egg whites in a large, clean bowl and whisk with an electric hand whisk until stiff but not dry. They are ready when you can turn the bowl upside down without the eggs sliding out.\", \"Gradually whisk in the sugar, a tablespoonful at a time, whisking for a few seconds between each addition. Adding the sugar slowly helps to build up volume in the meringue and make it stiff and shiny. Finally, whisk in the vanilla extract and cornflour until well combined.\", \"Dab a small amount of the meringue in the corners of a large, sturdy baking tray or sheet. Position the baking parchment, drawn side down, on the baking sheet, using the meringue dabs to secure it to the tray. You should be able to see the circle through the paper.\", \"Spoon the meringue into the circle and shape with the back of a serving spoon or rubber spatula to create a large meringue nest, with soft peaks rising on all sides.\", \"Place in the centre of the oven and bake for 1 hour until very lightly coloured and crisp on the outside. (If the meringue seems to be becoming too brown, reduce the temperature of the oven). Turn the oven off and leave the meringue for a further hour.\", \"Remove from the oven and leave to cool completely.\", \"Up to 2 hours before serving, carefully release the meringue from the baking parchment, using a spatula if necessary, and place onto a large serving plate. Whip the cream until soft peaks form and spoon into the centre of the meringue.\", \"Top with the strawberries, raspberries and blueberries, and the Cape gooseberries if using. Cut the passion fruit and scrape the pulp over.\", \"Decorate with sprigs of mint and dust with sifted icing sugar to serve.\"]', 4, NULL, 'images/recipes_images/pavlova.jpg'),
(29, 'Treacle pudding', 'A simple steamed syrup sponge, treacle pudding is guaranteed to please. Steam traditionally or microwave in 5 minutes.', 'less than 30 mins', 'over 2 hours', '[\"Grease a 1litre/1Â¾ pints pudding basin with butter. Put the golden syrup in to the bottom of the basin.\", \"In a separate bowl, using an electric hand whisk, mix the flour, baking powder, butter, eggs, sugar and treacle until well combined.\", \"Pour the mixture into the basin and cover with a piece of greaseproof paper.\", \"Take a piece of tin foil and make a pleat down the middle, then place this over the top of pudding basin and tie it in place like a lid. The pleat allows the foil to expand during cooking.\", \"Place an upturned saucer or a ramekin in a deep saucepan and sit the pudding on top. Add boiling water until it comes half-way up the basin. Place a lid on the pan and simmer gently to stream the pudding for about 2Â¼ hours, topping up the water as necessary.\", \"To check if the pudding is cooked, insert a metal skewer into the pudding. If it comes out clean it is ready.\", \"Carefully remove the pudding from the pan. Loosen the edges by running a table knife around the pudding and turn out onto a plate.\"]', 4, NULL, 'images/recipes_images/treacle_pudding.jpg'),
(30, 'Banana ice cream cheesecake', 'Nadiya\'s brilliant no-bake cheesecake is actually vegan. It uses frozen banana ice cream instead of cream cheese for the filling, with an oaty hazelnut base and tart blueberry topping.', 'less than 30 mins', 'less than 10 mins', '[\"Grease and line the base and sides of a 20cm/8in round loose-bottom tin, 7.5cm/3in deep.\", \"To make the base, toast the oats and hazelnuts in a large frying pan on a medium heat for about 5 minutes until they just start to turn golden-brown, stirring all the time. Pop them straight into a food processor and blend to a fine crumb. Add the coconut oil, golden syrup and salt and blend again until it all clumps together.\", \"Pour the mixture into the prepared tin and, using the back of a spoon, press into the base and 2.5cm/1in up the side. Put the base in the fridge while you make the filling.\", \"To make the filling, put the frozen bananas into a food processor with the golden syrup, cinnamon and cocoa. Leave for 5 minutes to allow the bananas to defrost just very slightly so that they process more easily, then blend until you have what looks like a soft-scoop ice cream. Quickly spoon the mixture on top of the prepared base and pop into the freezer until you are ready to eat.\", \"When you are ready to eat, make the compote by adding the blueberries, lemon zest and juice and sugar to a pan and stirring over a medium heat until the blueberries have just softened. This should only take a few minutes. You can make the compote well in advance and, if you do, keep it chilled in the fridge until serving.\", \"Take the cheesecake out of the freezer, slide it out of the cake tin and place on a serving dish. Add the warm compote on top and leave for just a few minutes before slicing and enjoying.\"]', 4, NULL, 'images/recipes_images/banana_ice_cream.jpg'),
(31, 'Roast pork', 'Roast pork shoulder with the perfect crackling gets a Hairy Bikers\' Med makeover with smoky Spanish spices. Serve with simple potatoes and the tasty pan juices.', 'less than 30 mins', 'over 2 hours', '[\"Preheat the oven to 230C/210C Fan/Gas 8. For the rub, mix all the rub ingredients together with a pinch of salt.\", \"Push the rub into the score lines of the pork skin and deep into the flesh â you should be able to do this without cutting through the meat as the joint is rolled. Wipe off any excess from the skin, then rub with the olive oil and pour over the lemon juice. Sprinkle the skin with salt.\", \"Spread the onion over the base of a roasting tin and place the pork on top. Add 250ml/9fl oz water. Roast on the high heat for half an hour â after this point the skin should be starting to crisp up and brown. Reduce the heat to 180C/160C Fan/Gas 4, then continue to roast for 25 minutes per half kilo of meat.\", \"Remove the pork from the oven and leave to rest, lightly covered with foil, for at least 15 minutes. Strain off the contents of the roasting tin, arranging the onions around the pork if you like, then wait for the liquid to settle. Skim off the fat (there will be quite a lot).\", \"If making gravy, sprinkle a tablespoon of flour over the roasting tin and stir over a medium heat until you have scraped up anything stuck to the base of the tin. Add the wine or sherry and mix until you have a roux-like paste. Add the skimmed pan juices and thin with a little more water if necessary to make a gravy.\", \"Alternatively, simply serve the pork with the skimmed pan juices â they will have plenty of flavour from the rub.\"]', 1, NULL, 'images/recipes_images/roast_pork.jpg'),
(32, 'Spaghetti with garlic and chilli', 'This is the easiest pasta to make and one of the best: simply a clove of garlic, a pinch of chilli flakes, a little parsley and a generous blessing of olive oil.', 'less than 30 mins', '10 to 30 mins', '[\"Add 2 tablespoons salt to 2 litres water and bring to the boil in a large saucepan. Add the spaghetti and return to the boil quickly, then cook until al dente.\", \"Finely chop the garlic and parsley together.\", \"Heat the oil in a frying pan over a low heat. Add the garlic and parsley and fry for 1 minute, or until the garlic is softened but not coloured. Add the chilli flakes and cook for 1 more minute.\", \"Drain the spaghetti lightly, then add to the frying pan with the water still clinging to it. Mix to coat with the oil. Add a little extra cooking water if needed. Sprinkle the spaghetti with the parsley, toss, season with salt and serve.\"]', 1, NULL, 'images/recipes_images/spaghetti_with_garlic.jpg'),
(33, 'Butternut squash curry with chickpeas', 'An easy vegan butternut squash and chickpea curry that freezes well.', 'less than 30 mins', '30 mins to 1 hour', '[\"Heat the oil in a large saucepan over a high heat, then add the mustard and cumin seeds, cardamom and curry leaves. Cook, stirring, for 30 seconds, or until the mustard seeds begin to pop.\", \"Add the onions to the pan, reduce the heat to medium and cook, stirring often, for 8 minutes, or until softened and starting to brown. Toss the garlic and ginger into the pan and cook for 2 minutes. Lower the heat a little, stir in the ground spices and cook, stirring, for 1 minute.\", \"Pour in the vegetable stock and bring to the boil. Add the butternut squash, bring back to the boil, then lower the heat and simmer for 15 minutes. Stir in the coconut cream, chickpeas and beans and cook for 10â15 minutes, or until the sauce is reduced and thickened slightly.\", \"Meanwhile heat up the pouches of rice (if using), following the packet instructions. Serve the curry in warmed bowls, with the rice and salad on the side if you like.\"]', 3, NULL, 'images/recipes_images/butternut_squash.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_ingredient_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipe_ingredient_id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES
(1, 1, 54, '125g/4½oz self-raising brown or self-raising , plus extra for dusting'),
(2, 1, 132, 'pinch fine'),
(3, 1, 5, '125g/4½oz full-fat plain'),
(4, 1, 81, '1 yellow or orange , seeds removed and thinly sliced'),
(5, 1, 57, '1 cut into 1cm/½in slices'),
(6, 1, 124, '1 cut into thin wedges'),
(7, 1, 102, '1 tbsp extra virgin , plus extra for drizzling'),
(8, 1, 82, '½ tsp  flakes'),
(9, 1, 143, 'freshly ground'),
(10, 1, 58, 'fresh  leaves, to serve (optional)'),
(11, 1, 39, '6 tbsp  sauce (approximately 100g/3½oz)'),
(12, 1, 78, '1 tsp dried'),
(13, 2, 102, '2 tbsp  or sun-dried tomato oil from the jar'),
(14, 2, 50, '6 rashers of smoked streaky , chopped'),
(15, 2, 68, '2 large, chopped'),
(16, 2, 123, '3  cloves, crushed'),
(17, 2, 99, '2 large glasses of'),
(18, 2, 44, '2x400g cans'),
(19, 2, 97, '1x290g jar antipasti marinated s, drained'),
(20, 2, 45, '2 fresh or dried bay leaves'),
(21, 2, 78, '1 tsp dried  or a small handful of fresh leaves, chopped'),
(22, 2, 47, '1 tsp dried  or a small handful of fresh leaves, chopped'),
(23, 2, 9, 'Drizzle'),
(24, 2, 143, 'Salt and freshly ground'),
(25, 2, 58, 'A good handful of fresh  leaves, torn into small pieces'),
(26, 2, 116, '800g-1kg/1¾-2¼lb dried'),
(27, 2, 106, 'Lots of freshly grated parmesan, to serve'),
(28, 3, 72, '125g/4½oz'),
(29, 3, 8, '2 tbsp'),
(30, 3, 160, '1 tsp'),
(31, 3, 132, 'good pinch'),
(32, 3, 12, '150ml/5fl oz soya milk or'),
(33, 3, 120, '¼ tsp'),
(34, 3, 153, '4 tsp , for frying'),
(35, 4, 122, '5 tbsp'),
(36, 4, 68, '2 s, finely sliced'),
(37, 4, 5, '200g/7oz Greek or natural'),
(38, 4, 100, '4 tbsp finely grated'),
(39, 4, 123, '3 tbsp finely grated'),
(40, 4, 4, '1 tsp Kashmiri red'),
(41, 4, 159, '5 tsp ground'),
(42, 4, 146, '1 tsp ground  seeds'),
(43, 4, 132, '4 tsp'),
(44, 4, 90, '1 juice only'),
(45, 4, 135, '30g/1oz  leaves and stalks, finely chopped'),
(46, 4, 6, '30g/1oz  leaves, finely chopped'),
(47, 4, 2, '3 green es finely chopped'),
(48, 4, 73, '800g/1lb 12oz boneless  tenderloin or leg, cut into bite-sized pieces'),
(49, 4, 129, '4 tbsp'),
(50, 4, 152, '1½ tbsp full-fat'),
(51, 4, 101, '1 tsp  strands (a large pinch)'),
(52, 4, 41, '400g/14oz'),
(53, 4, 134, '2 tbsp  seeds, to garnish (optional)'),
(54, 5, 138, '225g/8oz , prepared according to the packet instructions'),
(55, 5, 48, '8 small , flesh and rind finely chopped'),
(56, 5, 62, '180g/6oz dried cranberries'),
(57, 5, 71, '120g/4oz s, toasted'),
(58, 5, 155, '160g/5¾oz unsalted shelled  nuts, roughly chopped'),
(59, 5, 102, '125ml/4fl oz'),
(60, 5, 145, '60g/2¼oz flatleaf , finely chopped'),
(61, 5, 123, '4  cloves, crushed'),
(62, 5, 51, '4 tbsp'),
(63, 5, 124, '1 finely chopped'),
(64, 5, 96, '1 tsp , or to taste'),
(65, 5, 55, '80g/2¾oz  leaves'),
(66, 6, 152, '125ml/4½fl oz'),
(67, 6, 129, '125ml/4½fl oz'),
(68, 6, 17, '2-3 drops'),
(69, 6, 80, '4 free-range s'),
(70, 6, 8, '170g/6oz'),
(71, 6, 156, '1 tbsp'),
(72, 6, 98, '30g/1oz'),
(73, 6, 157, '500g/1lb 2oz s, cut in half, stones removed'),
(74, 6, 7, '2 tbsp'),
(75, 6, 30, '30g/1oz  (optional)'),
(76, 6, 32, ', for dusting'),
(77, 6, 129, ', to serve'),
(78, 7, 15, '280g/10oz s'),
(79, 7, 26, '65g/2¼oz granulated'),
(80, 7, 146, '¼ tsp ground'),
(81, 7, 98, '128g/4½oz unsalted , melted'),
(82, 7, 132, 'large pinch'),
(83, 7, 26, '100g/3½ oz granulated'),
(84, 7, 77, '2 tbsp plus ¼ tsp powdered'),
(85, 7, 129, '120ml/4fl oz'),
(86, 7, 154, '115g/4 oz , at room temperature'),
(87, 7, 147, '850g tin Alfonso  pulp'),
(88, 7, 132, 'large pinch'),
(89, 8, 44, '1 x 400g tin'),
(90, 8, 16, '2 tbsp rose'),
(91, 8, 8, '2 tsp'),
(92, 8, 34, 'good squeeze'),
(93, 8, 68, '1 , very thinly sliced into half moons'),
(94, 8, 109, '2 level tsp'),
(95, 8, 145, '20g/¾oz flatleaf , finely chopped'),
(96, 8, 5, '150g/5½oz plain'),
(97, 8, 6, '1 heaped tsp dried'),
(98, 8, 143, 'salt and freshly ground'),
(99, 8, 63, '500g/1lb 2oz s, very thinly sliced lengthways'),
(100, 8, 161, '2 tsp garlic'),
(101, 8, 18, '2 tsp sweet'),
(102, 8, 135, '2 heaped tsp ground'),
(103, 8, 115, '2 tsp  salt'),
(104, 8, 123, '3 tsp  granules'),
(105, 8, 143, '½ tsp freshly ground'),
(106, 8, 112, '4 white s'),
(107, 8, 95, '¼ small , very finely shredded'),
(108, 8, 42, '2 es, sliced cut into half moons'),
(109, 8, 2, '4 pickled, thinly sliced (optional)'),
(110, 9, 89, '225g/8oz plain'),
(111, 9, 8, '350g/12½oz'),
(112, 9, 43, '85g/3oz  powder'),
(113, 9, 160, '1½ tsp'),
(114, 9, 56, '1½ tsp'),
(115, 9, 80, '2 free-range'),
(116, 9, 152, '250ml/9fl oz'),
(117, 9, 122, '125ml/4½fl oz'),
(118, 9, 120, '2 tsp'),
(119, 9, 28, '200g/7oz plain'),
(120, 9, 129, '200ml/7fl oz'),
(121, 10, 98, '50g/1¾oz , softened'),
(122, 10, 123, '1  clove, crushed'),
(123, 10, 100, '1 heaped tsp finely grated fresh root'),
(124, 10, 59, '1 tbsp chopped fresh'),
(125, 10, 38, '½ grated zest only'),
(126, 10, 76, '1 free-range oven-ready , about 1.2kg/4lb 8oz'),
(127, 10, 68, '2 large s, very thickly sliced'),
(128, 10, 122, '2 tbsp'),
(129, 10, 143, 'salt and freshly ground'),
(130, 10, 156, '45g/1½oz'),
(131, 10, 91, '100ml/3½fl oz dry'),
(132, 10, 24, '500ml/18fl oz'),
(133, 10, 127, '1 tbsp'),
(134, 10, 125, 'dash Worcestershire sauce (optional)'),
(135, 10, 108, 'dash  (optional)'),
(136, 10, 59, '1 tbsp chopped fresh'),
(137, 11, 122, '2 tbsp'),
(138, 11, 150, '900g/2lb  fillet, cut into 3cm/1in cubes'),
(139, 11, 68, '2 roughly chopped'),
(140, 11, 123, '3 cloves, peeled and crushed'),
(141, 11, 2, '2 green es, finely chopped'),
(142, 11, 100, '1 tbsp grated fresh'),
(143, 11, 148, '1 tsp ground'),
(144, 11, 121, '1½ tbsp'),
(145, 11, 159, '1½ tbsp ground'),
(146, 11, 4, '1 tbsp mild Kashmiri'),
(147, 11, 42, '6 large es, roughly chopped'),
(148, 11, 119, '400ml/14fl oz'),
(149, 11, 24, '600ml/1 pint  or lamb stock'),
(150, 11, 70, '250g/9oz baby  leaves'),
(151, 11, 5, '200g/7oz plain'),
(152, 11, 143, 'salt and freshly ground'),
(153, 11, 41, 'steamed , to serve'),
(154, 12, 122, '3 tbsp'),
(155, 12, 11, '½ tsp'),
(156, 12, 68, '60g/2Â½oz chopped'),
(157, 12, 100, '1 tsp finely chopped'),
(158, 12, 23, '60g/2½oz frozen'),
(159, 12, 159, '1 tsp ground'),
(160, 12, 4, '¼ tsp red'),
(161, 12, 121, '½-¾ tsp'),
(162, 12, 126, '1-2 tsp dried mango powder, to taste (alternatively, use juice of 1/2 a lemon)'),
(163, 12, 96, ' to taste'),
(164, 12, 66, '600g/1lb 5oz es, peeled, boiled until soft and crushed into large lumps'),
(165, 12, 117, '4 tbsp chopped fresh coriander leaves'),
(166, 12, 93, 'packet ready-made'),
(167, 12, 98, '5 tbsp melted , for brushing'),
(168, 12, 22, '2 tbsp  (optional) (you can also use poppy or nigella seeds)'),
(169, 13, 57, '120g/4½oz, coarsely grated'),
(170, 13, 132, '½ tsp'),
(171, 13, 80, '1 large free-range'),
(172, 13, 160, '½ tsp'),
(173, 13, 156, '3 tbsp'),
(174, 13, 159, '1½ tsp ground'),
(175, 13, 23, '50g/2 oz frozen s, thawed'),
(176, 13, 122, ' for frying'),
(177, 13, 143, 'freshly ground'),
(178, 13, 5, '2 tbsp plain'),
(179, 13, 83, '1 tsp'),
(180, 14, 102, '1 tbsp'),
(181, 14, 68, '1 roughly chopped'),
(182, 14, 158, '2 large, peeled and roughly chopped'),
(183, 14, 100, '4cm/1½ inches fresh root, finely chopped'),
(184, 14, 123, '1 clove, crushed'),
(185, 14, 140, '700g/1lb 10oz es, peeled and cubed'),
(186, 14, 131, '1.2 litres/2 pints'),
(187, 14, 81, 'salt and freshly ground black'),
(188, 15, 61, '1 large, left whole'),
(189, 15, 94, '4 tbsp'),
(190, 15, 100, '2.5cm/1in piece fresh root, peeled and grated'),
(191, 15, 2, '4 green, finely chopped and seeds removed'),
(192, 15, 123, '4 cloves, crushed'),
(193, 15, 11, '1 tbsp black'),
(194, 15, 148, '2 tsp ground'),
(195, 15, 119, '400ml tin'),
(196, 15, 38, '1 unwaxed, halved'),
(197, 15, 66, '600g/1lb 5oz es, scrubbed, skin left on and cut into 2cm/Â¾in pieces'),
(198, 15, 143, 'salt and freshly ground'),
(199, 15, 5, '50g/1¾oz Greek-style (or a thick dairy-free alternative), to serve'),
(200, 15, 144, '25g/1oz blanched, to serve'),
(201, 15, 135, 'leaves, to serve'),
(202, 15, 156, '200g/7oz , plus extra for dusting'),
(203, 15, 160, '1 tsp'),
(204, 15, 5, '200g/7oz Greek-style or 150ml/5fl oz warm water'),
(205, 16, 61, '1 head , broken into large florets'),
(206, 16, 98, '40g/1½oz'),
(207, 16, 156, '40g/1½oz'),
(208, 16, 152, '400ml/14fl oz'),
(209, 16, 13, '1 tsp English mustard'),
(210, 16, 136, '100g/3½oz mature cheddar, grated'),
(211, 16, 143, 'salt and freshly ground'),
(212, 17, 23, '450g/1lb frozen petit pois or s, defrosted and drained'),
(213, 17, 124, '½ , finely chopped'),
(214, 17, 123, '1 clove, finely chopped'),
(215, 17, 6, '1 small bunch fresh  leaves'),
(216, 17, 5, '115g/4oz plain'),
(217, 17, 2, '½ red , seeds removed, finely chopped'),
(218, 17, 159, '1 tsp ground'),
(219, 17, 135, '½ tsp ground'),
(220, 17, 90, '1 juice only'),
(221, 17, 143, 'salt and freshly ground'),
(222, 17, 102, '2 tbsp extra virgin'),
(223, 17, 49, '1 large bag ready-made'),
(224, 18, 67, '900g/2lb very fresh fillet'),
(225, 18, 105, '1 tbsp cracked black'),
(226, 18, 96, ''),
(227, 18, 102, '2 tbsp light'),
(228, 18, 81, '1 yellow'),
(229, 18, 122, '½ tbsp'),
(230, 18, 104, '8-12 cooked'),
(231, 18, 42, '2 plum '),
(232, 18, 31, '175g/6 oz, cooked'),
(233, 18, 110, '20 s'),
(234, 18, 81, 'salt and'),
(235, 18, 102, '2 tbsp virgin'),
(236, 18, 145, '2 tbsp chopped'),
(237, 18, 145, 'flat leaf, to garnish'),
(238, 18, 96, '½ tsp'),
(239, 18, 53, '1½ tbsp Dijon mustard'),
(240, 18, 34, '4 tsp'),
(241, 18, 123, '1 clove, crushed'),
(242, 18, 114, '5 drops Tabasco sauce'),
(243, 18, 102, '110ml/4fl oz light'),
(244, 18, 80, '1, yolk only'),
(245, 19, 124, '½, finely chopped'),
(246, 19, 59, '3-4 sprigs , leaves picked and finely chopped'),
(247, 19, 109, '1 tbsp good-quality (preferably Moscatel vinegar)'),
(248, 19, 102, '3 tbsp extra virgin'),
(249, 19, 122, ' for frying'),
(250, 19, 50, '2 rashers streaky, diced'),
(251, 19, 84, '2 slices good-quality'),
(252, 19, 21, '1 handful toasted s, lightly crushed'),
(253, 19, 46, '200g/7oz good-quality mixed'),
(254, 19, 143, 'salt and freshly ground'),
(255, 20, 64, '400g/14oz tin, drained and rinsed'),
(256, 20, 42, '4 ripe es, chopped'),
(257, 20, 81, '2 large roasted s, chopped'),
(258, 20, 70, '2 large handfuls (about 100g/3½oz)'),
(259, 20, 85, '160g/5¾oz'),
(260, 20, 58, 'handful fresh'),
(261, 20, 102, '2 tbsp'),
(262, 20, 113, '1 tbsp cider'),
(263, 20, 90, '½, juice only'),
(264, 21, 98, '25g/1oz'),
(265, 21, 102, '1 tbsp'),
(266, 21, 68, '2 large, finely sliced'),
(267, 21, 19, '750g/1½lb Pink Fir Apple potatoes, peeled, parboiled and sliced into 1cm/½in pieces'),
(268, 21, 70, '250g/8oz handful fresh , cooked and roughly chopped'),
(269, 21, 80, '10 free-range, lightly beaten'),
(270, 21, 81, 'salt and freshly ground'),
(271, 22, 154, '100g/3½oz full-fat'),
(272, 22, 98, '100g/3½oz unsalted , softened'),
(273, 22, 32, '4 tbsp'),
(274, 22, 25, '2 tbsp, plus extra for drizzling'),
(275, 22, 96, 'pinch'),
(276, 22, 86, 'pinch'),
(277, 22, 122, '1.5/2 litres/2½/3½ pints'),
(278, 22, 158, '300g/10½oz (3/4 medium ones), peeled and grated'),
(279, 22, 27, '50g/1¾oz, roughly chopped'),
(280, 22, 139, '50g/1¾oz'),
(281, 22, 72, '120g/4½oz'),
(282, 22, 160, '½ tsp'),
(283, 22, 8, '20g/¾oz'),
(284, 22, 86, '1 tsp'),
(285, 22, 96, '½ tsp'),
(286, 22, 80, '2 medium free-range s, lightly beaten'),
(287, 22, 32, 'up to 1 tbsp , for dusting'),
(288, 23, 8, '50g/1¾oz'),
(289, 23, 98, '50g/1¾oz, diced, plus extra for greasing'),
(290, 23, 37, '1 tbsp dark'),
(291, 23, 141, '1 tbsp ginger syrup'),
(292, 23, 149, '2 large, ripe but firm'),
(293, 23, 80, '2 large free-range'),
(294, 23, 98, '125g/4½oz, well softened'),
(295, 23, 8, '125g/4Â½oz'),
(296, 23, 156, '125g/4½oz'),
(297, 23, 160, '1 tsp'),
(298, 23, 29, '1 tsp ground ginger'),
(299, 23, 69, '½ tsp ground'),
(300, 24, 64, '1 x 410g/14oz tin, rinsed and drained'),
(301, 24, 131, '4 tbsp water'),
(302, 24, 123, '2 large cloves'),
(303, 24, 151, '3 tbsp (sesame paste)'),
(304, 24, 34, '3 tbsp'),
(305, 24, 96, ', to taste'),
(306, 24, 102, '1 tbsp'),
(307, 24, 145, 'chopped fresh'),
(308, 24, 102, ''),
(309, 24, 71, ' fried'),
(310, 24, 18, ''),
(311, 25, 100, '2cm/1in piece fresh root , peeled'),
(312, 25, 2, '2 red es, seeds removed'),
(313, 25, 3, '250g/9oz white meat'),
(314, 25, 117, '1 tbsp roughly chopped fresh coriander'),
(315, 25, 36, '2, finely sliced'),
(316, 25, 80, '2 free-range'),
(317, 25, 107, '7-8 tbsp'),
(318, 25, 156, ', for dusting'),
(319, 25, 102, '25ml/1fl oz'),
(320, 25, 2, 'sweet  jam'),
(321, 25, 46, 'few handfuls'),
(322, 25, 102, ', for drizzling'),
(323, 25, 143, 'salt and freshly ground'),
(324, 26, 80, '4 large free-range'),
(325, 26, 92, '275g/10oz  meat'),
(326, 26, 47, '1 tsp fresh  leaves'),
(327, 26, 145, '1 tbsp chopped fresh'),
(328, 26, 36, '1, very finely chopped'),
(329, 26, 143, 'salt and freshly ground'),
(330, 26, 156, '125g/4oz , seasoned with salt and freshly ground black pepper'),
(331, 26, 80, '1 free-range , beaten'),
(332, 26, 107, '125g/4oz'),
(333, 26, 122, ' for deep frying'),
(334, 27, 79, '397g tin'),
(335, 27, 98, '120g/4½oz, cubed'),
(336, 27, 152, '125ml/4fl oz'),
(337, 27, 96, 'pinch'),
(338, 28, 111, '4 large free-range'),
(339, 28, 8, '225g/8oz'),
(340, 28, 120, '½ tsp'),
(341, 28, 142, '1 tbsp'),
(342, 28, 129, '400ml/14fl oz'),
(343, 28, 52, '400g/14oz strawberries, hulled, halved if large'),
(344, 28, 118, '200g/7oz raspberries'),
(345, 28, 103, '150g/5oz blueberries'),
(346, 28, 14, 'Cape gooseberries (optional)'),
(347, 28, 87, '3  (optional)'),
(348, 28, 6, 'sprigs, to decorate'),
(349, 28, 32, 'sifted, to decorate'),
(350, 29, 98, '180g/6oz unsalted , softened, plus extra for greasing'),
(351, 29, 33, '3 tbsp'),
(352, 29, 156, '180g/6oz'),
(353, 29, 160, '3 tsp'),
(354, 29, 80, '3 free-range'),
(355, 29, 130, '180g/6oz'),
(356, 29, 128, '1 tbsp'),
(357, 30, 10, '160g/5¾oz  oats'),
(358, 30, 21, '160g/5¾oz roasted whole'),
(359, 30, 94, '60ml/2fl oz , plus extra for greasing'),
(360, 30, 33, '185g/6½oz'),
(361, 30, 96, 'pinch'),
(362, 30, 137, '7 frozen, about 580g/1lb 4½oz, chopped into pieces'),
(363, 30, 33, '2 tbsp'),
(364, 30, 74, '½ tsp ground'),
(365, 30, 43, '1 tbsp  powder'),
(366, 30, 103, '250g/9oz fresh or frozen blueberries'),
(367, 30, 38, '½, zest and juice'),
(368, 30, 8, '100g/3½oz'),
(369, 31, 60, '2/2.5kg/4lb 8oz/5lb 8oz boned, rolled, skin scored'),
(370, 31, 102, '1 tbsp'),
(371, 31, 38, '½, juice only'),
(372, 31, 68, '2, thickly sliced'),
(373, 31, 96, ''),
(374, 31, 123, '4  cloves, crushed'),
(375, 31, 2, '1 red, finely chopped'),
(376, 31, 20, '1 tbsp, lightly crushed'),
(377, 31, 75, '4 , ground'),
(378, 31, 143, '½ tsp corns, crushed'),
(379, 31, 40, '1 tsp'),
(380, 31, 74, '1 tsp ground'),
(381, 31, 47, '1 tsp dried  (or 1 tbsp finely chopped fresh )'),
(382, 31, 78, '1 tsp dried  (or 1 tbsp finely chopped fresh )'),
(383, 31, 102, '3 tbsp'),
(384, 31, 35, '1 tbsp red wine'),
(385, 31, 156, '1 tbsp'),
(386, 31, 91, '100ml/3½fl oz or Fino sherry'),
(387, 32, 116, '200g/7oz dried'),
(388, 32, 123, '1 fat  clove'),
(389, 32, 145, 'handful fresh  leaves'),
(390, 32, 102, '3 tbsp extra virgin'),
(391, 32, 132, ''),
(392, 33, 122, '3 tbsp'),
(393, 33, 11, '2 tbsp black'),
(394, 33, 159, '1 tbsp  seeds'),
(395, 33, 146, '12  pods, split'),
(396, 33, 1, 'handful of'),
(397, 33, 68, '2 large, chopped'),
(398, 33, 123, '5 cloves, grated'),
(399, 33, 100, '5cm/2in piece fresh root, finely grated'),
(400, 33, 148, '2 tsp ground'),
(401, 33, 159, '1 tsp ground'),
(402, 33, 135, '2 tbsp ground'),
(403, 33, 131, '1 litre/1¾ pint hot'),
(404, 33, 133, '1kg/2lb 4oz peeled, deseeded (prepared weight), cut into 2.5cm/1in chunks'),
(405, 33, 65, '250ml/9fl oz'),
(406, 33, 64, '2 x 400g tins, drained and rinsed'),
(407, 33, 31, '200g/7oz, cut into 2.5cm/1in lengths'),
(408, 33, 88, '3 x 250g/9oz pouches ready-cooked pilau'),
(409, 33, 124, 'cucumber, tomato and  salad');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `firstname`, `lastname`, `email`, `password`) VALUES
(11, 'spalu', 'stefano', 'palumbo', 'spalumbo@fakemail.com', '$2y$10$qS70rFXpaDhuMR6yjjZkxe92FueDyaL3xgufuk9qC4Cp8P1HaD0IW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`recipe_ingredient_id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `recipe_ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`),
  ADD CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`);
COMMIT;

ALTER TABLE ratings
ADD UNIQUE KEY unique_rating (recipe_id, user_id);

ALTER TABLE ratings
ADD CONSTRAINT UNIQUE (recipe_id, user_id);

ALTER TABLE ratings
CHANGE value rating INT NOT NULL;

ALTER TABLE ratings
ADD CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
