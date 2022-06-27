import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:test1/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  VoidCallback? function,
  String? label,
  bool isUpper = true,
}) => Container(
  width: width,
  color: background,
  padding: const EdgeInsets.symmetric(vertical: 10),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpper ? label!.toUpperCase() : label!,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

Widget defaultTextFormField({
  required TextEditingController? controller,
  required String? Function(String?)? validate,
  Function(String?)? onSubmit,
  Function(String?)? onChange,
  VoidCallback? onTap,
  required TextInputType? keyboardType,
  required String? label,
  required IconData? prefixIcon,
  IconData? suffixIcon,
  bool isPassword = false,
  VoidCallback? suffixPressed
}) => TextFormField(
  validator: validate,
  obscureText: isPassword,
  controller: controller,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  keyboardType: keyboardType,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefixIcon,
    ),
    suffixIcon: suffixIcon != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(suffixIcon),
    ) : null,
    border: const OutlineInputBorder(),
  ),
  onTap: onTap ,
);

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  background: Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.centerRight,
    color: Colors.red,
    child: const Text(
      "Delete",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    ),
  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteData(id: model['id']);
  },
  child:   Container(

    padding: const EdgeInsets.all(16),

    child: Row(

      children: [

        CircleAvatar(

          radius: 35,

          backgroundColor: Colors.blue,

          child: Text(

            "${model['time']}",

            style: const TextStyle(

                color: Colors.white

            ),

          ),

        ),

        const SizedBox(width: 15,),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                "${model['title']}",

                style: const TextStyle(

                    fontSize: 16,

                ),

              ),

             const SizedBox(height: 5,),

              Text(

                "${model['date']}",

                style: const TextStyle(

                    color: Colors.grey,

                  fontSize: 12

                ),

              ),

            ],

          ),

        ),

        Expanded(

          child: Row(

            mainAxisAlignment: MainAxisAlignment.end,

            children: [

              IconButton(

                onPressed: (){

                  AppCubit.get(context).updateDatabase(status: "done", id: model['id']);

                },

                icon: const Icon(Icons.check_box, size: 25,), color: Colors.grey.shade700,

              ),

              IconButton(

                onPressed: (){

                  AppCubit.get(context).updateDatabase(status: "archive", id: model['id']);

                },

                icon: const Icon(Icons.archive, size: 25,), color: Colors.grey.shade700,

              ),

            ],

          ),

        ),

      ],

    ),

  ),
);

Widget taskBuilder({required List<Map> tasks}) {
  return ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: tasks.length,
      ),
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu, size: 100, color: Colors.grey.shade300,),
          Text(
            "No tasks here please add some",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}
