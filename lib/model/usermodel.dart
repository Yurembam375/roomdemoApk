
// To parse this JSON data, do
//
//     final customerdatamodel = customerdatamodelFromJson(jsonString);

import 'dart:convert';

Customerdatamodel customerdatamodelFromJson(String str) => Customerdatamodel.fromJson(json.decode(str));

String customerdatamodelToJson(Customerdatamodel data) => json.encode(data.toJson());

class Customerdatamodel {
    final List<CustomerEstimateFlow> customerEstimateFlow;

    Customerdatamodel({
        required this.customerEstimateFlow,
    });

    factory Customerdatamodel.fromJson(Map<String, dynamic> json) => Customerdatamodel(
        customerEstimateFlow: List<CustomerEstimateFlow>.from(json["Customer_Estimate_Flow"].map((x) => CustomerEstimateFlow.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Customer_Estimate_Flow": List<dynamic>.from(customerEstimateFlow.map((x) => x.toJson())),
    };
}

class CustomerEstimateFlow {
    final String estimateId;
    final String userId;
    final String movingFrom;
    final String movingTo;
    final DateTime movingOn;
    final String distance;
    final String propertySize;
    final String oldFloorNo;
    final String newFloorNo;
    final String oldElevatorAvailability;
    final String newElevatorAvailability;
    final String oldParkingDistance;
    final String newParkingDistance;
    final String unpackingService;
    final String packingService;
    final Items items;
    final String oldHouseAdditionalInfo;
    final String newHouseAdditionalInfo;
    final String totalItems;
    final String status;
    final DateTime orderDate;
    final DateTime dateCreated;
    final dynamic dateOfComplete;
    final dynamic dateOfCancel;
    final String estimateStatus;
    final String customStatus;
    final dynamic estimateComparison;
    final dynamic estimateAmount;
    final List<dynamic> successfulPayments;
    final String orderReviewed;
    final String callBack;
    final String moveDateFlexible;
    final FromAddress fromAddress;
    final ToAddress toAddress;
    final String serviceType;
    final dynamic storageItems;

    CustomerEstimateFlow({
        required this.estimateId,
        required this.userId,
        required this.movingFrom,
        required this.movingTo,
        required this.movingOn,
        required this.distance,
        required this.propertySize,
        required this.oldFloorNo,
        required this.newFloorNo,
        required this.oldElevatorAvailability,
        required this.newElevatorAvailability,
        required this.oldParkingDistance,
        required this.newParkingDistance,
        required this.unpackingService,
        required this.packingService,
        required this.items,
        required this.oldHouseAdditionalInfo,
        required this.newHouseAdditionalInfo,
        required this.totalItems,
        required this.status,
        required this.orderDate,
        required this.dateCreated,
        required this.dateOfComplete,
        required this.dateOfCancel,
        required this.estimateStatus,
        required this.customStatus,
        required this.estimateComparison,
        required this.estimateAmount,
        required this.successfulPayments,
        required this.orderReviewed,
        required this.callBack,
        required this.moveDateFlexible,
        required this.fromAddress,
        required this.toAddress,
        required this.serviceType,
        required this.storageItems,
    });

    factory CustomerEstimateFlow.fromJson(Map<String, dynamic> json) => CustomerEstimateFlow(
        estimateId: json["estimate_id"],
        userId: json["user_id"],
        movingFrom: json["moving_from"],
        movingTo: json["moving_to"],
        movingOn: DateTime.parse(json["moving_on"]),
        distance: json["distance"],
        propertySize: json["property_size"],
        oldFloorNo: json["old_floor_no"],
        newFloorNo: json["new_floor_no"],
        oldElevatorAvailability: json["old_elevator_availability"],
        newElevatorAvailability: json["new_elevator_availability"],
        oldParkingDistance: json["old_parking_distance"],
        newParkingDistance: json["new_parking_distance"],
        unpackingService: json["unpacking_service"],
        packingService: json["packing_service"],
        items: Items.fromJson(json["items"]),
        oldHouseAdditionalInfo: json["old_house_additional_info"],
        newHouseAdditionalInfo: json["new_house_additional_info"],
        totalItems: json["total_items"],
        status: json["status"],
        orderDate: DateTime.parse(json["order_date"]),
        dateCreated: DateTime.parse(json["date_created"]),
        dateOfComplete: json["date_of_complete"],
        dateOfCancel: json["date_of_cancel"],
        estimateStatus: json["estimate_status"],
        customStatus: json["custom_status"],
        estimateComparison: json["estimate_comparison"],
        estimateAmount: json["estimateAmount"],
        successfulPayments: List<dynamic>.from(json["successfulPayments"].map((x) => x)),
        orderReviewed: json["order_reviewed"],
        callBack: json["call_back"],
        moveDateFlexible: json["move_date_flexible"],
        fromAddress: FromAddress.fromJson(json["from_address"]),
        toAddress: ToAddress.fromJson(json["to_address"]),
        serviceType: json["service_type"],
        storageItems: json["storage_items"],
    );

    Map<String, dynamic> toJson() => {
        "estimate_id": estimateId,
        "user_id": userId,
        "moving_from": movingFrom,
        "moving_to": movingTo,
        "moving_on": movingOn.toIso8601String(),
        "distance": distance,
        "property_size": propertySize,
        "old_floor_no": oldFloorNo,
        "new_floor_no": newFloorNo,
        "old_elevator_availability": oldElevatorAvailability,
        "new_elevator_availability": newElevatorAvailability,
        "old_parking_distance": oldParkingDistance,
        "new_parking_distance": newParkingDistance,
        "unpacking_service": unpackingService,
        "packing_service": packingService,
        "items": items.toJson(),
        "old_house_additional_info": oldHouseAdditionalInfo,
        "new_house_additional_info": newHouseAdditionalInfo,
        "total_items": totalItems,
        "status": status,
        "order_date": orderDate.toIso8601String(),
        "date_created": dateCreated.toIso8601String(),
        "date_of_complete": dateOfComplete,
        "date_of_cancel": dateOfCancel,
        "estimate_status": estimateStatus,
        "custom_status": customStatus,
        "estimate_comparison": estimateComparison,
        "estimateAmount": estimateAmount,
        "successfulPayments": List<dynamic>.from(successfulPayments.map((x) => x)),
        "order_reviewed": orderReviewed,
        "call_back": callBack,
        "move_date_flexible": moveDateFlexible,
        "from_address": fromAddress.toJson(),
        "to_address": toAddress.toJson(),
        "service_type": serviceType,
        "storage_items": storageItems,
    };
}

class FromAddress {
    final String firstName;
    final String lastName;
    final String fromAddress;
    final String fromLocality;
    final String fromCity;
    final String fromState;
    final String pincode;

    FromAddress({
        required this.firstName,
        required this.lastName,
        required this.fromAddress,
        required this.fromLocality,
        required this.fromCity,
        required this.fromState,
        required this.pincode,
    });

    factory FromAddress.fromJson(Map<String, dynamic> json) => FromAddress(
        firstName: json["firstName"],
        lastName: json["lastName"],
        fromAddress: json["fromAddress"],
        fromLocality: json["fromLocality"],
        fromCity: json["fromCity"],
        fromState: json["fromState"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "fromAddress": fromAddress,
        "fromLocality": fromLocality,
        "fromCity": fromCity,
        "fromState": fromState,
        "pincode": pincode,
    };
}

class Items {
    final List<Inventory> inventory;
    final CustomItems customItems;

    Items({
        required this.inventory,
        required this.customItems,
    });

    factory Items.fromJson(Map<String, dynamic> json) => Items(
        inventory: List<Inventory>.from(json["inventory"].map((x) => Inventory.fromJson(x))),
        customItems: CustomItems.fromJson(json["customItems"]),
    );

    Map<String, dynamic> toJson() => {
        "inventory": List<dynamic>.from(inventory.map((x) => x.toJson())),
        "customItems": customItems.toJson(),
    };
}

class CustomItems {
    final String units;
    final List<CustomItemsItem> items;

    CustomItems({
        required this.units,
        required this.items,
    });

    factory CustomItems.fromJson(Map<String, dynamic> json) => CustomItems(
        units: json["units"],
        items: List<CustomItemsItem>.from(json["items"].map((x) => CustomItemsItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "units": units,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class CustomItemsItem {
    final String id;
    final String itemHeight;
    final String itemLength;
    final String itemQty;
    final String itemWidth;
    final String itemDescription;
    final String itemName;

    CustomItemsItem({
        required this.id,
        required this.itemHeight,
        required this.itemLength,
        required this.itemQty,
        required this.itemWidth,
        required this.itemDescription,
        required this.itemName,
    });

    factory CustomItemsItem.fromJson(Map<String, dynamic> json) => CustomItemsItem(
        id: json["id"],
        itemHeight: json["item_height"],
        itemLength: json["item_length"],
        itemQty: json["item_qty"],
        itemWidth: json["item_width"],
        itemDescription: json["item_description"],
        itemName: json["item_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item_height": itemHeight,
        "item_length": itemLength,
        "item_qty": itemQty,
        "item_width": itemWidth,
        "item_description": itemDescription,
        "item_name": itemName,
    };
}

class Inventory {
    final String id;
    final int order;
    final String name;
    final String displayName;
    final List<Category> category;

    Inventory({
        required this.id,
        required this.order,
        required this.name,
        required this.displayName,
        required this.category,
    });

    factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"],
        order: json["order"],
        name: json["name"],
        displayName: json["displayName"],
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "name": name,
        "displayName": displayName,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
    };
}

class Category {
    final String id;
    final int order;
    final String name;
    final String displayName;
    final List<ChildItemElement> items;

    Category({
        required this.id,
        required this.order,
        required this.name,
        required this.displayName,
        required this.items,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        order: json["order "],
        name: json["name"],
        displayName: json["displayName"],
        items: List<ChildItemElement>.from(json["items"].map((x) => ChildItemElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order ": order,
        "name": name,
        "displayName": displayName,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class ChildItemElement {
    final List<Size> size;
    final List<ChildItemElement> childItems;
    final String typeOptions;
    final Meta meta;
    final int uniquieId;
    final String name;
    final String displayName;
    final int order;
    final String nameOld;
    final int qty;
    final List<Type> type;
    final String id;

    ChildItemElement({
        required this.size,
        required this.childItems,
        required this.typeOptions,
        required this.meta,
        required this.uniquieId,
        required this.name,
        required this.displayName,
        required this.order,
        required this.nameOld,
        required this.qty,
        required this.type,
        required this.id,
    });

    factory ChildItemElement.fromJson(Map<String, dynamic> json) => ChildItemElement(
        size: List<Size>.from(json["size"].map((x) => Size.fromJson(x))),
        childItems: List<ChildItemElement>.from(json["childItems"].map((x) => ChildItemElement.fromJson(x))),
        typeOptions: json["typeOptions"],
        meta: Meta.fromJson(json["meta"]),
        uniquieId: json["uniquieId"],
        name: json["name"],
        displayName: json["displayName"],
        order: json["order"],
        nameOld: json["name_old"],
        qty: json["qty"],
        type: List<Type>.from(json["type"].map((x) => Type.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "size": List<dynamic>.from(size.map((x) => x.toJson())),
        "childItems": List<dynamic>.from(childItems.map((x) => x.toJson())),
        "typeOptions": typeOptions,
        "meta": meta.toJson(),
        "uniquieId": uniquieId,
        "name": name,
        "displayName": displayName,
        "order": order,
        "name_old": nameOld,
        "qty": qty,
        "type": List<dynamic>.from(type.map((x) => x.toJson())),
        "id": id,
    };
}

class Meta {
    final bool hasType;
    final SelectType selectType;
    final bool hasVariation;
    final bool hasSize;

    Meta({
        required this.hasType,
        required this.selectType,
        required this.hasVariation,
        required this.hasSize,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        hasType: json["hasType"],
        selectType: selectTypeValues.map[json["selectType"]]!,
        hasVariation: json["hasVariation"],
        hasSize: json["hasSize"],
    );

    Map<String, dynamic> toJson() => {
        "hasType": hasType,
        "selectType": selectTypeValues.reverse[selectType],
        "hasVariation": hasVariation,
        "hasSize": hasSize,
    };
}

enum SelectType {
    MULTIPLE,
    NONE,
    SINGLE
}

final selectTypeValues = EnumValues({
    "multiple": SelectType.MULTIPLE,
    "none": SelectType.NONE,
    "single": SelectType.SINGLE
});

class Size {
    final Option option;
    final Tooltip tooltip;
    final bool selected;

    Size({
        required this.option,
        required this.tooltip,
        required this.selected,
    });

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        option: optionValues.map[json["option"]]!,
        tooltip: tooltipValues.map[json["tooltip"]]!,
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "option": optionValues.reverse[option],
        "tooltip": tooltipValues.reverse[tooltip],
        "selected": selected,
    };
}

enum Option {
    LARGE,
    MEDIUM,
    SMALL
}

final optionValues = EnumValues({
    "large": Option.LARGE,
    "medium": Option.MEDIUM,
    "small": Option.SMALL
});

enum Tooltip {
    THE_2_FT_2_FT,
    THE_3_FT_3_FT,
    THE_46_FT,
    THE_4_FT,
    THE_4_FT_4_FT,
    THE_6_FT,
    XL,
    XXL,
    XXXL
}

final tooltipValues = EnumValues({
    "2ft * 2ft": Tooltip.THE_2_FT_2_FT,
    "3ft * 3ft": Tooltip.THE_3_FT_3_FT,
    "4-6 ft": Tooltip.THE_46_FT,
    "<4 ft": Tooltip.THE_4_FT,
    "4ft * 4ft": Tooltip.THE_4_FT_4_FT,
    ">6 ft": Tooltip.THE_6_FT,
    "XL": Tooltip.XL,
    "XXL": Tooltip.XXL,
    "XXXL": Tooltip.XXXL
});

class Type {
    final String id;
    final String option;
    final bool selected;

    Type({
        required this.id,
        required this.option,
        required this.selected,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        option: json["option"],
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "option": option,
        "selected": selected,
    };
}

class ToAddress {
    final String firstName;
    final String lastName;
    final String toAddress;
    final String toLocality;
    final String toCity;
    final String toState;
    final String pincode;

    ToAddress({
        required this.firstName,
        required this.lastName,
        required this.toAddress,
        required this.toLocality,
        required this.toCity,
        required this.toState,
        required this.pincode,
    });

    factory ToAddress.fromJson(Map<String, dynamic> json) => ToAddress(
        firstName: json["firstName"],
        lastName: json["lastName"],
        toAddress: json["toAddress"],
        toLocality: json["toLocality"],
        toCity: json["toCity"],
        toState: json["toState"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "toAddress": toAddress,
        "toLocality": toLocality,
        "toCity": toCity,
        "toState": toState,
        "pincode": pincode,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
